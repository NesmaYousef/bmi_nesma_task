import 'package:bmi_tt9/constants.dart';
import 'package:flutter/material.dart';

class My_fab extends StatelessWidget {
  const My_fab({Key? key, required this.onPressed, required this.icon})
      : super(key: key);
  final Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      padding: EdgeInsets.all(12),
      fillColor: btnColor,
      onPressed: onPressed,
      child: Icon(
        icon,
      ),
    );
  }
}
