import 'package:annavahan/pages/cart.dart';
import 'package:annavahan/pages/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:annavahan/pages/home.dart';

void main() => runApp(MaterialApp(
routes: {
  '/':(context) => Home(),
  '/cart':(context) => Cart(),
  '/orders':(context)=> Home(),
  '/restaurant': (context) => Restaurant(),
},
));
