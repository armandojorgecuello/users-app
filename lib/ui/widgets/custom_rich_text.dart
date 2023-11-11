import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.title, 
    required this.subTitle, 
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          fontSize: 20, 
          fontWeight: FontWeight.bold, 
          color: Colors.black
        ),
        children: [
          TextSpan(
            text: '\n$subTitle',
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w400, 
              color: Colors.black
            )
          )
        ]
      )
    );
  }
}