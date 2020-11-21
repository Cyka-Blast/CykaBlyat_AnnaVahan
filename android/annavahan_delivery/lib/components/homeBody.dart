import 'dart:async';

import 'package:annavahan_delivery/components/orderCard.dart';
import 'package:annavahan_delivery/properties.dart';
import 'package:annavahan_delivery/services/client.dart';
import 'package:annavahan_delivery/services/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";
import 'package:geolocator/geolocator.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class Location {
  double latitude = 15.4100762;
  double longitude = 74.0085833;
}

class _BodyState extends State<Body> {
  Location location = Location();
  int i = 0;
  @override
  void initState(){
    super.initState();
    Timer timer = Timer.periodic(Duration(seconds: 20), (Timer t) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: properties.white,
        child: Column(
          children: [
            Text(
              'Orders',
              style: TextStyle(
                color: properties.accent,
                fontFamily: 'Gotu',
                fontSize: 25,
              ),
            ),
            Center(
              child: FutureBuilder(
                  future: getOrderRequest(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error in loading');
                      } else {
                        var orders = snapshot.data.reversed.toList();
                        return Container(
                          width: 370,
                          height: 620,
                          child: ListView.builder(
                            itemCount: orders.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 0.0,
                                ),
                                child: Container(
                                  height: 80,
                                  child: OrderCard(
                                      order: orders[index]
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
