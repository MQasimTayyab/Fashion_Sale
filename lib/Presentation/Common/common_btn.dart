import 'package:fashion_sale/Data/app_color.dart';
import 'package:fashion_sale/Presentation/Common/common_text.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? navigateTo;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;

  const CommonButton({
    required this.text,
    required this.onPressed,
    this.navigateTo,
    this.color,
    this.textColor,
    this.borderRadius,
    super.key,
  });
//button

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
        if (navigateTo != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => navigateTo!),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor ?? Colors.white),
        textScaler: CommonText.textScaler,
      ),
    );
  }
}
