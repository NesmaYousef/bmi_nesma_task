import 'package:flutter/material.dart';

import '../constants.dart';

class CardContent extends StatelessWidget {
  final IconData? icon;
  final String? text;
  const CardContent({
    super.key,
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 64,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          text!.toUpperCase(),
          style: titleStyle,
        )
      ],
    );
  }
}
