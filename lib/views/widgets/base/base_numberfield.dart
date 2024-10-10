import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseNumberfield extends StatefulWidget {
  final String label;
  final String? initNumer;
  final Function(String) setValue;
  final String endText;
  final String? Function(String?)? validator;
  const BaseNumberfield(
      {super.key,
      required this.label,
      this.initNumer,
      required this.setValue,
      required this.endText,
      this.validator});

  @override
  BaseNumberfieldState createState() => BaseNumberfieldState();
}

class BaseNumberfieldState extends State<BaseNumberfield> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initNumer);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.white.withOpacity(0.5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlign: TextAlign.center,
          controller: controller,
          validator: widget.validator,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              labelText: widget.label, border: InputBorder.none),
          onChanged: (value) => widget.setValue(value),
        )),
        Text(widget.endText),
      ]),
    );
  }
}
