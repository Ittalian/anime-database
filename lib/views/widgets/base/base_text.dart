import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String value;
  final double fontSize;

  const BaseText({
    super.key,
    required this.value,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
