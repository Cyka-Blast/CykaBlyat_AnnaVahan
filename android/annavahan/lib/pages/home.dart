import 'package:annavahan/components/appbar.dart';
import 'package:annavahan/components/homeBody.dart';
import 'package:annavahan/components/navdrawer.dart';
import 'package:annavahan/properties.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Body(),
      drawer: NavDrawer(),
      backgroundColor: properties.primary,
    );
  }
}
