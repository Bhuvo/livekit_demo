import 'package:demo/widgets/space.dart';
import 'package:flutter/material.dart';
class MCheckBox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const MCheckBox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Color(0xFF00AEBD),
          fillColor: WidgetStateProperty.all(Colors.white),
          side: BorderSide(color: Colors.black),
        ),
        Space(5),
        Text(label),
      ],
    );
  }
}
