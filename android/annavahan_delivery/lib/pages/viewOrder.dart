import 'package:annavahan_delivery/components/appbar.dart';
import 'package:annavahan_delivery/components/navdrawer.dart';
import 'package:annavahan_delivery/properties.dart';
import 'package:annavahan_delivery/services/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Order order = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: appBar,
      drawer: NavDrawer(),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 80.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Order ${order.id}',
                style: TextStyle(
                  color: properties.primary,
                  fontFamily: 'Gotu',
                  fontSize: 30,
                ),
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[800],
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PickUp Location: ',
                    style: TextStyle(
                      color: Colors.grey[400],
                      letterSpacing: 1.0,
                        fontFamily: 'Open Sans'
                    ),
                  ),
                  FlatButton(
                    onPressed: ()async{
                      String url = 'geo:0,0?q=${order.r_latitude},${order.r_longitude}(${order.resName})';
                      if (await canLaunch(url)) {
                        print(await canLaunch(url));
                        await launch(url);
                      }
                    },
                    child: Text(
                      'Open In Google Maps',
                      style: TextStyle(
                          color: properties.accent,
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans'
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Text(
                    'Drop Location:',
                    style: TextStyle(
                      color: Colors.grey[400],
                      letterSpacing: 1.0,
                        fontFamily: 'Open Sans'
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      String url = 'geo:0,0?q=${order.c_latitude},${order.c_longitude}(${order.resName})';
                      if (await canLaunch(url)) {
                      print(await canLaunch(url));
                      await launch(url);
                      }
                    },
                    child: Text(
                      'Open in Google Maps',
                      style: TextStyle(
                          color: properties.accent,
                          letterSpacing: 1.0,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans'
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
