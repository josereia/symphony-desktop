import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:symphony_desktop/ui/widgets/alert_dialog_widget.dart';

class AutoUpdater {
  static const String currentVersion = "0.0.1";
  static const String githubURL =
      'https://raw.githubusercontent.com/josereia/symphony-desktop/master/version.json';

  AutoUpdater();

  Future<Map<String, dynamic>> _getVersionData() async {
    return await http.get(Uri.parse(githubURL)).then((response) {
      return json.decode(response.body);
    });
  }

  Future<void> checkForUpdates(BuildContext context) async {
    return await _getVersionData().then((data) {
      if (data['version'] != currentVersion) {
        showDialog(
          context: context,
          builder: (context) => AlertDialogWidget(
            title: "Atualização disponível",
            content: "Uma nova versão do symphony está disponível.\n\n"
                "Versão atual: $currentVersion\n"
                "Nova versão: ${data['version']}",
            confirmButtonText: "Atualizar",
            confirmButtonAction: () => quitAndInstall(),
            cancelButtonText: "Cancelar",
          ),
        );
      }
    });
  }

  void quitAndInstall() {}
}
