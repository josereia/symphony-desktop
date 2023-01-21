import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/app.dart';
import 'package:symphony_desktop/bindings/initial_binding.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/translations.dart';
import 'package:symphony_desktop/ui/theme/app_theme.dart';

final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
NavigatorState? get navigation => _navigationKey.currentState;

WindowEffect _getWindowEffect() {
  if (Platform.isMacOS) {
    return WindowEffect.mica;
  } else if (Platform.isWindows) {
    return WindowEffect.acrylic;
  } else {
    return WindowEffect.transparent;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();

  await Window.setEffect(
    effect: _getWindowEffect(),
    dark:
        SchedulerBinding.instance.window.platformBrightness == Brightness.dark,
  );

  if (Platform.isMacOS) {
    //await Window.makeTitlebarTransparent();
    //await Window.enableFullSizeContentView();
  } else if (Platform.isWindows) {
    await Window.hideWindowControls();
  }

  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(1280, 800);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initial,
      initialBinding: InitialBinding(),
      builder: (context, child) => AppBuilderWidget(child: child),
      navigatorKey: _navigationKey,
      theme: AppTheme(isDark: false).getTheme(),
      darkTheme: AppTheme(isDark: true).getTheme(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("pt", "BR"),
      translations: Languages(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
    );
  }
}
