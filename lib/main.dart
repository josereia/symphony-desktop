import 'dart:io';
import 'dart:ui';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/bindings/initial_binding.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/translations.dart';
import 'package:symphony_desktop/ui/theme/app_theme.dart';
import 'package:symphony_desktop/ui/widgets/base_widget.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  if (!kIsWeb) {
    DartVLC.initialize();
    WidgetsFlutterBinding.ensureInitialized();
    await Window.initialize();
    await Window.setEffect(
      effect:
          Platform.isWindows ? WindowEffect.tabbed : WindowEffect.transparent,
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
      builder: (context, child) => BaseWidget(child: child),
      navigatorKey: navigationKey,
      theme: LightTheme().getTheme(),
      //darkTheme: DarkTheme().getTheme(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("pt", "BR"),
      translations: Languages(),
      debugShowCheckedModeBanner: false,
    );
  }
}
