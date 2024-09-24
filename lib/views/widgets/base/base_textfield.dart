import 'package:flutter/material.dart';

class BaseTextfield extends StatefulWidget {
  final String label;
  final String? initText;
  final Function(String) setValue;
  const BaseTextfield(
      {super.key, required this.label, this.initText, required this.setValue});

  @override
  State<BaseTextfield> createState() => BaseTextfieldState();
}

class BaseTextfieldState extends State<BaseTextfield> {
  late TextEditingController controller = TextEditingController(text: widget.initText ?? '');

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: widget.label),
        onChanged: (value) => widget.setValue(value),
      ),
    );
  }
}
