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
  static const String currentVersion = "0.0.1";
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

  void _quitAndInstall(String filepath) async {
    await Process.start(filepath, ["-t", "-l", "1000"]).then((value) {
      SystemNavigator.pop();
      exit(0);
    });
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
      ).then((value) => _quitAndInstall(file.path));
    });
  }

  Future<void> checkForUpdates() async {
    await _getVersionData().then(
      (data) {
        if (data['version'] != currentVersion) {
          showDialog(
            useRootNavigator: true,
            context: context,
            builder: (context) => AlertDialogWidget(
              title: "Atualização disponível",
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(
                      "Uma nova versão do symphony está disponível.\n $currentVersion > ${data['version']}",
                    ),
                    const SizedBox(height: 16),
                    const Text("Changelog:"),
                    Text(data['changelog'].join("\n")),
                  ],
                ),
              ),
              confirmButtonText: "update".tr,
              confirmButtonAction: () => _downloadNewVersion(
                data['windows_path'],
              ),
            ),
          );
        }
      },
    );
  }
}
