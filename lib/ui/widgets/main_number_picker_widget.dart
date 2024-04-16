import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class MainNumberPickerWidget extends StatefulWidget {
  const MainNumberPickerWidget(
      {super.key,
      required this.minValue,
      required this.maxValue,
      required this.currentValue,
      required this.onChange});

  final int minValue;
  final int maxValue;
  final int currentValue;
  final Function(int) onChange;

  @override
  State<MainNumberPickerWidget> createState() => _MainNumberPickerWidgetState();
}

class _MainNumberPickerWidgetState extends State<MainNumberPickerWidget> {
  late int _currentValue = widget.currentValue;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
        minValue: widget.minValue,
        maxValue: widget.maxValue,
        value: _currentValue,
        onChanged: (value) {
          setState(() {
            _currentValue = value;
            widget.onChange(value);
          });
        });
  }
}
