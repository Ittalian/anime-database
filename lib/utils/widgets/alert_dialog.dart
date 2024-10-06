import 'package:flutter/material.dart';

class AlertMessageDialog extends StatefulWidget {
  final String message;
  final Function() onPressed;
  const AlertMessageDialog(
      {super.key, required this.message, required this.onPressed});

  @override
  AlertMessageDialogState createState() => AlertMessageDialogState();

  static Future<void> show(
      BuildContext context, String message, Function() onPressed) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return PopScope(
              canPop: false,
              child:
                  AlertMessageDialog(message: message, onPressed: onPressed));
        });
  }
}

class AlertMessageDialogState extends State<AlertMessageDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.message),
      actions: <Widget>[
        TextButton(
            onPressed: () async {
              widget.onPressed();
              Navigator.pop(context);
            },
            child: const Text('はい')),
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text('いいえ')),
      ],
    );
  }
}
