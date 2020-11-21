import 'package:annavahan/components/RestaurantCard.dart';
import 'package:annavahan/components/menuItemCard.dart';
import 'package:annavahan/properties.dart';
import 'package:annavahan/services/Business.dart';
import 'package:annavahan/services/client.dart';
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
  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      title: Text(
        "Choose a location",
        style: TextStyle(
          fontFamily: 'Gotu',
        ),
      ),
      content: Container(
        height: 200,
        width: 300,
        child: FlutterMap(
          options: new MapOptions(
            center: new LatLng(location.latitude, location.longitude),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(location.latitude, location.longitude),
                  anchorPos: AnchorPos.align(AnchorAlign.center),
                  builder: (ctx) => new Container(
                    child: Icon(
                      Icons.location_on,
                      color: properties.accent,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        FlatButton.icon(
          icon: Icon(Icons.my_location, color: properties.accent),
          label: Text("Current Location",
              style:
                  TextStyle(color: properties.accent, fontFamily: 'Open Sans')),
          onPressed: () async {
            Position location = await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.high);
            setState(() {
              this.location.longitude = location.longitude;
              this.location.latitude = location.latitude;
              Navigator.pop(context);
            });
          },
        ),
        FlatButton(
          child: Text("OK",
              style:
                  TextStyle(color: properties.accent, fontFamily: 'Open Sans')),
          onPressed: () {
            customer.latitude = location.latitude;
            customer.longitude = location.longitude;
            Navigator.pop(context);
            i = 1;
          },
        ),
      ],
    );
    Future.delayed(
        Duration.zero,
        () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            ));
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        color: properties.white,
        child: Column(
          children: [
            Text(
              'Choose a Restaurant',
              style: TextStyle(
                color: properties.accent,
                fontFamily: 'Gotu',
                fontSize: 25,
              ),
            ),
            Center(
              child: FutureBuilder(
                  future: getRestaurantRequest(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Loading...');
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error in loading');
                      } else {
                        var restaurants = snapshot.data;
                        return Container(
                          width: 370,
                          height: 620,
                          child: ListView.builder(
                            itemCount: restaurants.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 0.0,
                                ),
                                child: Container(
                                  height: 80,
                                  child: RestaurantCard(
                                      restaurant: restaurants[index]),
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
