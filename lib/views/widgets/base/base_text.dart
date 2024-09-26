import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String value;
  final double fontSize;
  final Color? fontColor;

  const BaseText({
    super.key,
    required this.value,
    required this.fontSize,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: fontSize,
        color: fontColor ?? Colors.black,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 1,
    );
  }
}
