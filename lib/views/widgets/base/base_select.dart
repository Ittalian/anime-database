import 'package:flutter/material.dart';

class BaseSelect extends StatefulWidget {
  final Map<String, String> selectMap;
  final String hintText;
  final int initDate;
  final Function(String) onSelected;
  const BaseSelect(
      {super.key,
      required this.selectMap,
      required this.hintText,
      required this.initDate,
      required this.onSelected});

  @override
  BaseSelectState createState() => BaseSelectState();
}

class BaseSelectState extends State<BaseSelect> {
  String? selectedDay;

  @override
  void initState() {
    super.initState();
    if (widget.initDate != 0) {
      // selectedDay = widget.selectMap.entries
      //     .firstWhere((entry) => entry.value == widget.initDate.toString(),
      //         orElse: () => const MapEntry('', ''))
      //     .value;
      setState(() {
        selectedDay = widget.initDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withOpacity(0.5),
        padding: const EdgeInsets.all(10),
        child: DropdownButton<String>(
          value: selectedDay,
          hint: Text(widget.hintText),
          onChanged: (String? newValue) {
            setState(() {
              selectedDay = newValue;
            });
            widget.onSelected(newValue!);
          },
          items:
              widget.selectMap.entries.map<DropdownMenuItem<String>>((select) {
            return DropdownMenuItem<String>(
              value: select.value,
              child: Text(select.key),
            );
          }).toList(),
        ));
  }
}
