import 'package:flutter/material.dart';

class BottomBtn extends StatelessWidget {
  final String? btnText;
  final Function()? onTap;

  const BottomBtn({
    super.key,
    this.btnText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffE83D66),
        ),
        child: Center(
          child: Text(btnText!.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 24.0,
              )),
        ),
      ),
    );
  }
}
