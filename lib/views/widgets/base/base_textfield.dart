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
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: widget.label, border: InputBorder.none),
        onChanged: (value) => widget.setValue(value),
      ),
    );
  }
}
