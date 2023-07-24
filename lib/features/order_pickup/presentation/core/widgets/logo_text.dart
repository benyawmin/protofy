import 'package:flutter/material.dart';

// Logo text format of the GOODBYTZ
class LogoText extends StatelessWidget {
  final double fontSize;
  const LogoText({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
        children: const <TextSpan>[
          TextSpan(
              text: 'GOOD',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          TextSpan(text: 'BYTZ'),
        ],
      ),
    );
  }
}
