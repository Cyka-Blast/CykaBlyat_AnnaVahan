import 'package:annavahan_delivery/pages/viewOrder.dart';
import 'package:flutter/material.dart';
import 'package:annavahan_delivery/pages/home.dart';

void main() => runApp(MaterialApp(
routes: {
  '/':(context) => Home(),
  '/order':(context)=> ViewOrder(),
},
));
