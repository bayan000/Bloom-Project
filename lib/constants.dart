import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


const defaultPadding = 16.0;

const Color white = Colors.white;
const Color black = Colors.black;
const Color red = Colors.red;
const Color grey = Colors.grey;
Color buttonColor = Color(0xFF659B5E);
Color buttonColorOpa = Color(0xFF92A78E);
const Color textColor = Color(0xFF556F44);
Color fieldColor = Color(0xFFE8E8E8);
Color cardColor = Color(0xFFF3F3F3);
const Color primaryColor = Color(0xFF659B5E);//Color(0xFF2697FF);
const Color secondaryColor = Color(0xFF92A78E);//buttonColorOpa;
const Color bgColor = Color(0xFF556F44);//Color(0xFF212332);
TextStyle communTextStyle20textColor=TextStyle(color: textColor,
  fontFamily: 'font1',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
TextStyle communTextStyle24textColor=TextStyle(color: textColor,
  fontFamily: 'font1',
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
TextStyle communTextStyle28textColor=TextStyle(color: textColor,
  fontFamily: 'font1',
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
TextStyle communTextStyle34textColor=TextStyle(color: textColor,
  fontFamily: 'font1',
  fontSize: 34,
  fontWeight: FontWeight.bold,
);

TextStyle communTextStyle20white=TextStyle(color: white,
  fontFamily: 'font1',
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
TextStyle communTextStyle24white=TextStyle(color: white,
  fontFamily: 'font1',
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
TextStyle communTextStyle28white=TextStyle(color: white,
  fontFamily: 'font1',
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
TextStyle communTextStyle34white=TextStyle(color: white,
  fontFamily: 'font1',
  fontSize: 34,
  fontWeight: FontWeight.bold,
);
TextStyle communTextStyle24black=TextStyle(color: black,
  fontFamily: 'font1',
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
String formatDateString(String dateTimeString) {
  final DateTime dateTime = DateTime.parse(dateTimeString);
  return DateFormat('yyyy-MM-dd').format(dateTime);
}