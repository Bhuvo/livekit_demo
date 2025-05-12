import 'package:flutter/material.dart';
import 'm_check_box.dart';

class CheckBoxList<T> extends StatefulWidget {
  final List<T> items;
  final String Function(T) labelBuilder;
  final void Function(Map<T, bool>)? onChanged;

  const CheckBoxList({
    super.key,
    required this.items,
    required this.labelBuilder,
    this.onChanged,
  });

  @override
  State<CheckBoxList<T>> createState() => _CheckBoxListState<T>();
}

class _CheckBoxListState<T> extends State<CheckBoxList<T>> {
  late Map<T, bool> checkedValues;

  @override
  void initState() {
    super.initState();
    checkedValues = {
      for (var item in widget.items) item: false,
    };
  }

  void _updateValue(T item, bool value) {
    setState(() {
      checkedValues[item] = value;
    });
    widget.onChanged?.call(checkedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.items.map((item) {
        final label = widget.labelBuilder(item);
        return MCheckBox(
          label: label,
          value: checkedValues[item] ?? false,
          onChanged: (val) => _updateValue(item, val ?? false),
        );
      }).toList(),
    );
  }
}
