import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/app.dart';
import 'package:symphony_desktop/bindings/initial_binding.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/translations.dart';
import 'package:symphony_desktop/ui/theme/app_theme.dart';

final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
NavigatorState? get navigation => _navigationKey.currentState;

Future<void> main() async {
  if (!kIsWeb) {
    final bool isWindows11 = int.parse(
          Platform.operatingSystemVersion
              .split("Build ")[1]
              .replaceAll(")", ""),
        ) >
        22523;
    DartVLC.initialize();
    WidgetsFlutterBinding.ensureInitialized();
    await Window.initialize();
    await Window.setEffect(
      effect: Platform.isWindows
          ? isWindows11
              ? WindowEffect.tabbed
              : WindowEffect.acrylic
          : WindowEffect.transparent,
      dark: false,
      /*dark: SchedulerBinding.instance.window.platformBrightness ==
          Brightness.dark*/
    );
    await Window.hideWindowControls();
    runApp(const MyApp());
    doWhenWindowReady(() {
      const initialSize = Size(1280, 800);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
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
      theme: LightTheme().getTheme(),
      //darkTheme: DarkTheme().getTheme(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("pt", "BR"),
      translations: Languages(),
      debugShowCheckedModeBanner: false,
    );
  }
}
