import 'package:fitness_trainer_app/core/themeing/app_colors.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  final double? width;
  final double? height;
  final double? fontSize;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
    this.width,
    this.height,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(40),
        ),
        alignment: Alignment.center,
        child: Text(
          buttonName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
