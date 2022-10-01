import 'dart:math';
import 'dart:ui';
import 'package:dart_periphery/dart_periphery.dart';
import 'package:get/get.dart';

class _Color {
  final double distance;
  final List color;

  _Color({required this.distance, required this.color});
}

class ArduinoController {
  final List _colors = [
    [255, 0, 0], //vermelho
    [255, 130, 0], //vermelho1
    [255, 200, 0], //vermelho2
    [255, 230, 0], //vermelho3
    [255, 255, 0], //vermelho4
    [0, 255, 0], //verde
    [0, 255, 200], //verde1
    [0, 255, 230], //verde2
    [0, 239, 255], //verde3
    [0, 200, 255], //verde4
    [0, 0, 255], //azul
    [120, 0, 255], //azul1
    [200, 0, 255], //azul2
    [240, 0, 255], //azul3
    [255, 0, 180], //azul4
    [255, 255, 255], //branco
  ];

  String _getColor(Color color) {
    List<_Color> newColors = [];
    List colorToAnalyze = [color.red, color.green, color.blue];

    for (var i = 0; i < _colors.length; i++) {
      final distance = sqrt(pow((colorToAnalyze[0] - _colors[i][0]), 2) +
          pow((colorToAnalyze[1] - _colors[i][1]), 2) +
          pow((colorToAnalyze[2] - _colors[i][2]), 2));

      newColors.add(
        _Color(distance: distance, color: _colors[i]),
      );
    }

    newColors.sort(
      (a, b) => a.distance.compareTo(b.distance),
    );

    return newColors[0]
        .color
        .toString()
        .replaceAllMapped("[", (match) => "")
        .replaceAllMapped("]", (match) => "")
        .removeAllWhitespace;
  }

  void sendColor(Color color) {
    final String colorToSend = _getColor(color);

    //serial library settings
    setCPUarchitecture(CPU_ARCHITECTURE.x86_64);
    useLocalLibrary();

    //serial port
    var serial = Serial('/dev/ttyACM0', Baudrate.b9600);

    try {
      serial.writeString(colorToSend);
    } catch (error) {
      error.printError();
      error.printInfo();
    } finally {
      serial.dispose();
    }
  }
}
