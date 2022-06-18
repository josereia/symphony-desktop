import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/ui/theme/theme.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await Window.initialize();
    await Window.setEffect(
      effect:
          Platform.isWindows ? WindowEffect.acrylic : WindowEffect.transparent,
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
      theme: CustomTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
