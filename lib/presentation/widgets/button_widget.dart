import 'package:flutter/material.dart';
import 'package:pocketku/presentation/styles/pallet.dart';
import 'package:pocketku/presentation/styles/typography.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.width,
    required this.buttonTextSize,
    required this.buttonBorderColor,
  });
  final void Function() onTap;
  final double width;
  final String buttonText;
  final double buttonTextSize;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color buttonBorderColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(16),
      radius: 16,
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.buttonColor,
          border: Border.all(color: widget.buttonBorderColor),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: button.copyWith(
              color: widget.buttonTextColor,
              fontSize: widget.buttonTextSize,
            ),
          ),
        ),
      ),
    );
  }
}
