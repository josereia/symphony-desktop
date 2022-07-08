import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final String? confirmButtonText;
  final VoidCallback confirmButtonAction;
  final String? cancelButtonText;
  final VoidCallback? cancelButtonAction;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.confirmButtonAction,
    this.confirmButtonText,
    this.cancelButtonText,
    this.cancelButtonAction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: <Widget>[
        TextButton(
          child: Text(cancelButtonText ?? "cancel".tr),
          onPressed: () => cancelButtonAction ?? Navigator.pop(context),
        ),
        TextButton(
          child: Text(confirmButtonText ?? "confirm".tr),
          onPressed: () {
            confirmButtonAction();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
