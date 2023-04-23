import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:symphony_desktop/app_builder.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/data/providers/youtube_provider.dart';
import 'package:symphony_desktop/data/repositories/player_service_repository.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/routes/app_routes.dart';
import 'package:symphony_desktop/services/navigation_service.dart';
import 'package:symphony_desktop/services/player_service.dart';
import 'package:symphony_desktop/ui/themes/app_theme.dart';

bool _isTransparent = false;

String _getWindowsVersion() {
  if (Platform.operatingSystemVersion.contains("10.")) {
    final String osVersion = Platform.operatingSystemVersion;
    final RegExp regExp = RegExp(r'\((?:.*\D)?(\d+)\)'); //get windows build
    final RegExpMatch? regExpMatch = regExp.firstMatch(osVersion);
    final String regExpResult = regExpMatch?.group(1) ?? "";
    final int windowsBuild = int.tryParse(regExpResult) ?? 0;

    if (windowsBuild > 22523) {
      return "windows11";
    } else {
      return "windows10";
    }
  } else {
    return "windows7";
  }
}

Future<void> _loadWindowEffect() async {
  await Window.initialize();
  if (Platform.isWindows) {
    final String version = _getWindowsVersion();
    switch (version) {
      case "windows7":
        _isTransparent = false;
        await Window.setEffect(effect: WindowEffect.solid);
        break;
      case "windows10":
        _isTransparent = true;
        await Window.setEffect(
          effect: WindowEffect.aero,
          color: Colors.transparent,
        );
        break;
      case "windows11":
        _isTransparent = true;
        await Window.setEffect(
          effect: WindowEffect.acrylic,
          color: Colors.transparent,
        );
        break;
      default:
        _isTransparent = false;
        await Window.setEffect(effect: WindowEffect.solid);
        break;
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb == false && Platform.isWindows) {
    await _loadWindowEffect();
  }

  if (kIsWeb == false && Platform.isWindows || Platform.isLinux) {
    DartVLC.initialize();
  }

  //services
  Get.lazyPut(() => NavigationService());
  Get.lazyPut(
    // ignore: unnecessary_cast
    () => PlayerService(
      repository: PlayerServiceRepository(
        songProvider: YoutubeProvider(),
      ),
    ) as PlayerService,
  );

  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(1366, 768);
    const minSize = Size(1280, 720);
    appWindow.size = initialSize;
    appWindow.minSize = minSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "symphony";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'symphony',
      theme: AppTheme.getTheme(isDark: false),
      darkTheme: AppTheme.getTheme(isDark: true),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initial,
      locale: const Locale("pt", "BR"),
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) => Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (BuildContext context) => AppBuilder(
              isTransparent: _isTransparent,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
