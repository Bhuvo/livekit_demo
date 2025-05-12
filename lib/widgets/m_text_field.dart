
import 'package:demo/widgets/space.dart';
import 'package:flutter/material.dart';

class MTextField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final Function(String? val)? onChanged;
  final Function()? onTap;
  final bool isRequired;
  final String? title;
  final int maxLines;
  final Widget? suffixIcon;
  const MTextField({super.key, this.hintText, this.onChanged, this.isRequired = false, this.title,  this.maxLines =1, this.onTap, this.suffixIcon, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != null)RichText(
          text: TextSpan(
            text: title ?? 'Program Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF2C2F3A), // Dark text color
            ),
            children: [
              if(isRequired) TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        Space(10),
        TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            hintText: hintText ?? 'Enter Program Name',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            fillColor: Color(0xF7F9FCFF),suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
          onTap: onTap,
          readOnly: onTap != null,
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter program name';
            }
            return null;
          },

        ),
      ],
    );
  }
}