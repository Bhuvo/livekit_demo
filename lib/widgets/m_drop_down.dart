import 'package:demo/widgets/space.dart';
import 'package:flutter/material.dart';

class MDropdownField<T> extends StatelessWidget {
  final String? title;
  final bool isRequired;
  final String? hintText;
  final List<T> items; // Changed from DropdownMenuItem<T>
  final T? value;
  final Function(T? val)? onChanged;
  final String Function(T)? itemLabelBuilder; // Optional custom label builder

  const MDropdownField({
    super.key,
    this.title,
    this.isRequired = false,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.itemLabelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title ?? 'Select Option',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF2C2F3A),
            ),
            children: [
              if (isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        const Space(10),
        DropdownButtonFormField<T>(
          value: value,
          items: items.map((T item) {
            final label = itemLabelBuilder?.call(item) ?? item.toString();
            return DropdownMenuItem<T>(
              value: item,
              child: Text(label),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText ?? 'Select an option',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            filled: true,
            fillColor: const Color(0xF7F9FCFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
          borderRadius: BorderRadius.circular(8),
          dropdownColor: const Color(0xF7F9FCFF),
          validator: (val) {
            if (isRequired && val == null) {
              return 'Please select an option';
            }
            return null;
          },
        ),
      ],
    );
  }
}
