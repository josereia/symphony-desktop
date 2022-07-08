import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final String? confirmButtonText;
  final VoidCallback confirmButtonAction;
  final String? cancelButtonText;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.confirmButtonAction,
    this.confirmButtonText,
    this.cancelButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(confirmButtonText ?? "confirm".tr),
          onPressed: () => confirmButtonAction(),
        ),
        TextButton(
          child: Text(cancelButtonText ?? "cancel".tr),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
