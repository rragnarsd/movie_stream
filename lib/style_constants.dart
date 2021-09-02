import 'package:flutter/material.dart';

const kTextStyleXSmall = TextStyle(fontSize: 14.0, color: Color(0xfffEEEEEE));

const kTextStyleSmall =
    TextStyle(fontSize: 18.0, letterSpacing: 1.0, fontWeight: FontWeight.w600);

const kTextStyleMedium = TextStyle(
  fontSize: 22.0,
  color: Color(0xffEEEEEE),
  fontWeight: FontWeight.w500,
  letterSpacing: 1.0,
);

const kTextStyleLarge = TextStyle(
  fontSize: 26.0,
  color: Color(0xffEEEEEE),
);

const kBoxDecorationAll = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20.0),
    bottomLeft: Radius.circular(20.0),
    topLeft: Radius.circular(5.0),
    bottomRight: Radius.circular(5.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Color(0xFF17181F),
      offset: const Offset(0, 2),
      blurRadius: 5.0,
      spreadRadius: 1.0,
    )
  ],
  color: Colors.grey,
);

const kBorderRadiusWithShadows = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      bottomRight: Radius.circular(20.0),
    ),
    color: Color(0xff2d2f3c),
    boxShadow: [
      BoxShadow(
        color: Color(0xFF17181F),
        offset: const Offset(2, 4),
        blurRadius: 5.0,
        spreadRadius: 1.0,
      )
    ]);

const kBorderRadiusOnly = BorderRadius.only(
  topLeft: Radius.circular(20.0),
  bottomRight: Radius.circular(20.0),
);

const kOnlyBoxShadow = BoxDecoration(boxShadow: [
  BoxShadow(
    color: Color(0xFF17181F),
    offset: const Offset(0, 2),
    blurRadius: 5.0,
    spreadRadius: 1.0,
  )
]);
