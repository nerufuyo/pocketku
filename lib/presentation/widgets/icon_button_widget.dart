import 'package:flutter/material.dart';
import 'package:pocketku/presentation/styles/pallet.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final Function() onTap;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(16),
      radius: 16,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(color: secondary20),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          widget.icon,
          size: 20,
          color: white,
        ),
      ),
    );
  }
}
