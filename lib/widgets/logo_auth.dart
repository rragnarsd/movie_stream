import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style_constants.dart';

class LogoAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 50,
        width: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ]),
        child: Center(
          child: RichTextLogo(
            sizeMoveiiz: 20.0,
            sizePlay: 20.0,
          ),
        ),
      ),
    );
  }
}

class RichTextLogo extends StatelessWidget {
  final double sizeMoveiiz;
  final double sizePlay;

  RichTextLogo({required this.sizeMoveiiz, required this.sizePlay});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: 'Moveiiz',
          style: kTextStyleMedium.copyWith(
            fontSize: sizeMoveiiz,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: Color(0xFF17181F),
          ),
        ),
        TextSpan(
          text: 'PLAY',
          style: kTextStyleMedium.copyWith(
              fontSize: sizePlay,
              fontWeight: FontWeight.w600,
              color: Color(0xffBD4B4B),
              letterSpacing: 0.5),
        ),
      ]),
    );
  }
}
