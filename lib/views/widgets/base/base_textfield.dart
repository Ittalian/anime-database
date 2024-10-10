import 'package:flutter/material.dart';

class BaseTextfield extends StatefulWidget {
  final String label;
  final String? initText;
  final Function(String) setValue;
  final String? Function(String?)? validator;
  const BaseTextfield(
      {super.key, required this.label, this.initText, required this.setValue, this.validator});

  @override
  State<BaseTextfield> createState() => BaseTextfieldState();
}

class BaseTextfieldState extends State<BaseTextfield> {
  late TextEditingController controller =
      TextEditingController(text: widget.initText ?? '');

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.white.withOpacity(0.5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: widget.validator,
        decoration:
            InputDecoration(labelText: widget.label, border: InputBorder.none),
        onChanged: (value) => widget.setValue(value),
      ),
    );
  }
}
