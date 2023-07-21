import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  final fontSize;
  const LogoText({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
              text: 'GOOD',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: 'BYTZ'),
        ],
      ),
    );
  }
}
