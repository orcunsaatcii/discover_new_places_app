import 'package:flutter/material.dart';

const Color backgroundColor = Color.fromARGB(255, 255, 252, 248);
const Color textColor = Color.fromARGB(255, 24, 24, 24);
const Color secondaryColor = Colors.orangeAccent;
const Color white = Color(0xFFFFFFFF);

Gradient primaryGradient = LinearGradient(
  colors: [backgroundColor, secondaryColor.withOpacity(0.7)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
