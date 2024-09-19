import 'package:flutter/material.dart';

class BaseTextfield extends StatefulWidget {
  final String label;
  final Function(String) setValue;
  const BaseTextfield({super.key, required this.label, required this.setValue});

  @override
  State<BaseTextfield> createState() => BaseTextfieldState();
}

class BaseTextfieldState extends State<BaseTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        decoration: InputDecoration(labelText: widget.label),
        onChanged: (value) => widget.setValue(value),
      ),
    );
  }
}
