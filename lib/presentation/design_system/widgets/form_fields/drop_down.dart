// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

class TracDropDownFormField extends StatefulWidget {
  final InputDecoration decoration;
  final List<Map<String, dynamic>> options;
  final void Function(dynamic) onChanged;
  final Widget icon;
  final dynamic initialValue;
  final bool isExpanded;

  const TracDropDownFormField(
      {super.key,
        required this.decoration,
        required this.options,
        required this.onChanged,
        required this.icon,
        this.isExpanded = false,
        this.initialValue});

  @override
  State<TracDropDownFormField> createState() => _TracDropDownFormFieldState();
}

class _TracDropDownFormFieldState extends State<TracDropDownFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: widget.isExpanded,
      decoration: widget.decoration,
      icon: widget.icon,
      value: widget.initialValue,
      items: widget.options
          .map<DropdownMenuItem<dynamic>>((e) => DropdownMenuItem<dynamic>(
        value: e["value"],
        child: Text(e["text"], maxLines: 1, overflow: TextOverflow.ellipsis),
      ))
          .toList(growable: false),
      onChanged: (value) => {
        widget.onChanged(value),
      },
    );
  }
}
