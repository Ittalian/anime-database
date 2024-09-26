import 'package:flutter/material.dart';

class BaseRadioButton extends StatefulWidget {
  final Map<String, String> selectMap;
  final Function(String) onSelected;
  const BaseRadioButton(
      {super.key, required this.selectMap, required this.onSelected});

  @override
  BaseRadioButtonState createState() => BaseRadioButtonState();
}

class BaseRadioButtonState extends State<BaseRadioButton> {
  String selectedValue = '';

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectMap.values.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.selectMap.entries.map((entry) {
          return Expanded(
              child: RadioListTile<String>(
                  title: Text(entry.key),
                  value: entry.value,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                      widget.onSelected(selectedValue);
                    });
                  }));
        }).toList());
  }
}
