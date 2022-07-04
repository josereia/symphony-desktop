import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/bindings/root_binding.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/ui/theme/app_theme.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:symphony_desktop/ui/widgets/base_widget.dart';

Future<void> main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await Window.initialize();
    await Window.setEffect(
      effect:
          Platform.isWindows ? WindowEffect.tabbed : WindowEffect.transparent,
      dark: false,
      /*dark: SchedulerBinding.instance.window.platformBrightness ==
          Brightness.dark*/
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initial,
      builder: (context, child) => BaseWidget(child: child),
      theme: LightTheme().getTheme(),
      //darkTheme: DarkTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      initialBinding: NavigationBinding(),
    );
  }
}
