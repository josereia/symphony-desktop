import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:symphony_desktop/ui/widgets/alert_dialog_widget.dart';

class AutoUpdater {
  final BuildContext context;
  static String currentVersion = Platform.isWindows ? "0.0.1" : "0.0.1";
  static const String githubURL =
      'https://raw.githubusercontent.com/josereia/symphony-desktop/main/';

  AutoUpdater({required this.context});

  Future<Map<String, dynamic>> _getVersionData() async {
    return await http
        .get(Uri.parse("${githubURL}version.json"))
        .then((response) {
      return json.decode(response.body);
    });
  }

  void _quitAndInstall(
      {required String appDir, required String filename}) async {
    if (Platform.isWindows) {
      await Process.start("$appDir/$filename", ["-t", "-l", "1000"]);
      SystemNavigator.pop();
      exit(0);
    } else {
      await Process.run("xdg-open", [appDir]);
      SystemNavigator.pop();
      exit(0);
    }
  }

  Future _downloadNewVersion(String path) async {
    final Dio dio = Dio();
    final filename = path.split("/").last;

    await getApplicationDocumentsDirectory().then((dir) {
      final file = File("${dir.path}/$filename");
      dio.download(
        "$githubURL$path",
        file.path,
        onReceiveProgress: (int received, int total) {
          log("$received/$total");
        },
      ).then(
        (value) => _quitAndInstall(
          appDir: dir.path,
          filename: filename,
        ),
      );
    });
  }

  Future<void> checkForUpdates() async {
    await _getVersionData().then(
      (data) {
        final newVersion = Platform.isWindows
            ? data["windows_version"]
            : data["linux_version"];
        final changelog = Platform.isWindows
            ? data["windows_changelog"]
            : data["linux_changelog"];
        final path =
            Platform.isWindows ? data["windows_path"] : data["linux_path"];

        if (newVersion != currentVersion) {
          showDialog(
            useRootNavigator: true,
            context: context,
            builder: (context) => AlertDialogWidget(
              title: "Atualiza????o dispon??vel",
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(
                      "Uma nova vers??o do symphony est?? dispon??vel.\n $currentVersion > $newVersion",
                    ),
                    const SizedBox(height: 16),
                    const Text("Mudan??as:"),
                    Text(changelog.join("\n")),
                  ],
                ),
              ),
              confirmButtonText: "update".tr,
              confirmButtonAction: () => _downloadNewVersion(path),
            ),
          );
        }
      },
    );
  }
}
