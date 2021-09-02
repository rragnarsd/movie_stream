import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/style_constants.dart';


class ReusableButton extends StatelessWidget {
  final String btnText;
  final int btnColor;
  final int btnTextColor;
  final Function function;

  const ReusableButton(
      {required this.btnText,
        required this.btnColor,
        required this.btnTextColor,
        required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () => function(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(
            btnText,
            textAlign: TextAlign.center,
            style: kTextStyleMedium.copyWith(
                fontSize: 18.0, color: Color(btnTextColor)),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          elevation: 5.0,
          primary: Color(btnColor),
        ),
      ),
    );
  }
}
