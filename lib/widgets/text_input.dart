import 'package:flutter/material.dart';
import 'package:reserva_ja/app_colors.dart';

class TextInput extends StatelessWidget {
  final String? label;
  final bool required;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final TextStyle style;
  final InputDecoration? decoration;

  const TextInput({
    super.key,
    this.label,
    this.decoration,
    this.controller,
    this.required = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.style = const TextStyle(fontSize: 16),
  });

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      return Column(
        children: <Widget>[
          SizedBox(
              child: TextField(
                style: style,
                decoration: decoration,
                controller: controller,
                obscureText: obscureText,
                keyboardType: keyboardType,
                textDirection: TextDirection.ltr,
              )
          )
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$label${required ? '*' : ''}',
          style: TextTheme.of(context).labelMedium?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryText
          ),
        ),
        const SizedBox(height: 4.0),
        SizedBox(
          child: TextField(
            style: style,
            decoration: decoration,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textDirection: TextDirection.ltr,
          )
        )
      ],
    );
  }
}