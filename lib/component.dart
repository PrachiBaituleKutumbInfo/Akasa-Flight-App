import 'package:flutter/material.dart';

class SlideContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String discount;
  final String details;
  final String codeLabel;
  final String promoCode;

  const SlideContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.discount,
    required this.details,
    required this.codeLabel,
    required this.promoCode,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30, // Position at the bottom
      left: 16, // Padding from left
      right: 16, // Padding from right
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title\n',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: ' $discount ',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: '$details\n',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: codeLabel,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: promoCode,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
