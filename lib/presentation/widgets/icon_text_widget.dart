import 'package:flutter/material.dart';
import 'package:pocketku/presentation/styles/typography.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });
  final IconData? icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.white,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: subtitle1.copyWith(color: color),
        ),
      ],
    );
  }
}
