import 'package:flutter/material.dart';

//Gradient for black color
LinearGradient greyGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 39, 38, 38),
      Color.fromRGBO(131, 130, 128, 1),
    ],
  );
}

LinearGradient oceanGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 27, 25, 25),
      Color.fromARGB(255, 9, 63, 70),
    ],
  );
}

//Gradient for orange color
LinearGradient orangeGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xfff74c06),
      Color(0xfff9bc2c),
    ],
  );
}
