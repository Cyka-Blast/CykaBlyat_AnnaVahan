import 'package:annavahan/properties.dart';
import 'package:flutter/material.dart';

AppBar appBar = AppBar(
  title: Text(
    properties.title,
    style: TextStyle(
      fontSize: 22,
      letterSpacing: 1.0,
      fontFamily: 'Gotu',
      color: properties.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: properties.primary,
  centerTitle: true,
  elevation: 0,
  shadowColor: properties.primary,
  iconTheme: IconThemeData(
    color: properties.white,
  ),
);
