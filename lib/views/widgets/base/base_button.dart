import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  const BaseButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontSize: 20)));
  }
}
