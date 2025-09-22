import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  static const TextScaler textScaler = TextScaler.linear(1.0);
  final String text;
  final Color? color;
  final TextStyle? style;

  const CommonText({
    Key? key,
    required this.text,
    this.color,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? TextStyle(color: color ?? Colors.black),
      textScaler: CommonText.textScaler,
    );
  }
}
