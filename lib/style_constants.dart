import 'package:flutter/material.dart';

const kTextStyleXSmall = TextStyle(fontSize: 14.0, color: Color(0xfffEEEEEE));

const kTextStyleSmall =
    TextStyle(fontSize: 18.0, letterSpacing: 1.0, fontWeight: FontWeight.w600);

const kTextStyleMedium = TextStyle(
    fontSize: 22.0,
    color: Color(0xffEEEEEE),
    /*color: Color(0xffEEEDF0),*/
    fontWeight: FontWeight.w500,
    letterSpacing: 1.0);

const kTextStyleLarge = TextStyle(fontSize: 26.0, color: Color(0xffEEEEEE));

const kBoxDecorationImage = BoxDecoration(
  image: DecorationImage(
    colorFilter: const ColorFilter.mode(
      Colors.black,
      /* Colors.black.withOpacity(0.2),*/
      BlendMode.dstATop,
    ),
    image: NetworkImage(
        'https://images.unsplash.com/photo-1584905066893-7d5c142ba4e1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'),
    fit: BoxFit.fitHeight,
  ),
);

const kBoxDecorationAll = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20.0),
    bottomLeft: Radius.circular(20.0),
    topLeft: Radius.circular(5.0),
    bottomRight: Radius.circular(5.0),
  ),
  /*boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                      )
                    ],*/
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
        color: Color(0xff2d2f3c),
        offset: const Offset(0, 2),
        blurRadius: 2.0,
        spreadRadius: 1.0,
      )
    ]);

const kBorderRadiusOnly = BorderRadius.only(
  topLeft: Radius.circular(20.0),
  bottomRight: Radius.circular(20.0),
);

