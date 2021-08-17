import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color? textColor;
  final VoidCallback? onPressed;

  RoundedButton({this.onPressed, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Color(0xffB2EBF2),
        borderRadius: BorderRadius.circular(24),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 60,
          child: Text(
            'Submit',
            style: TextStyle(
                color: Color(0xff212121),
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
