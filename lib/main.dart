import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:symphony_desktop/app_builder.dart';
import 'package:get/get.dart';
import 'package:symphony_desktop/routes/app_pages.dart';
import 'package:symphony_desktop/routes/app_routes.dart';
import 'package:symphony_desktop/services/navigation_services.dart';
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
        await Window.setEffect(
          effect: WindowEffect.solid,
          color: Colors.white,
          dark: false,
        );
        break;
      case "windows10":
        _isTransparent = true;
        await Window.setEffect(
          effect: WindowEffect.aero,
          color: Colors.white.withOpacity(0.6),
          dark: false,
        );
        break;
      case "windows11":
        _isTransparent = true;
        await Window.setEffect(
          effect: WindowEffect.acrylic,
          color: Colors.white,
          dark: false,
        );
        break;
      default:
        _isTransparent = false;
        await Window.setEffect(
          effect: WindowEffect.solid,
          color: Colors.white,
          dark: false,
        );
        break;
    }
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb == false && Platform.isWindows) await _loadWindowEffect();

  //services
  Get.lazyPut(() => NavigationService());

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
      darkTheme: AppTheme.getTheme(isDark: false),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.initial,
      locale: const Locale("pt", "BR"),
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget? child) => AppBuilder(
        isTransparent: _isTransparent,
        child: child,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
