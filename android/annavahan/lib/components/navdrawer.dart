import 'package:annavahan/properties.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: properties.primary),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: DrawerHeader(
                child: Container(
                    child: Text(
                      properties.title,
                      style: TextStyle(
                        color: properties.primary,
                        fontSize: 30,
                        fontFamily: 'Gotu',
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                decoration: BoxDecoration(
                  color: properties.white,
                ),
              ),
              height: 220,
            ),
            ListTile(
              leading: Icon(Icons.home_outlined, color: properties.white, size: 23,),
              visualDensity: VisualDensity.standard,
              title: Text(
                'Home',
                style: TextStyle(
                  color: properties.white,
                  fontFamily: 'Gotu',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                Route route = ModalRoute.of(context);
                if (route != null) {
                  if (route.settings.name != '/') {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/');
                  }
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood_outlined, color: properties.white, size: 25,),
              title: Text(
                'Order',
                style: TextStyle(
                  color: properties.white,
                  fontFamily: 'Gotu',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                Route route = ModalRoute.of(context);
                if (route != null) {
                  if (route.settings.name != '/report') {
                    if (route.settings.name != '/') {
                      Navigator.pop(context);
                    }
                    Navigator.pushNamed(context, '/report');
                  }
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.perm_identity, color: properties.white, size: 27),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: properties.white,
                  fontFamily: 'Gotu',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                Navigator.of(context).pop();
                Route route = ModalRoute.of(context);
                if (route != null) {
                  if (route.settings.name != '/reports') {
                    if (route.settings.name != '/') {
                      Navigator.pop(context);
                    }
                    Navigator.pushNamed(context, '/reports');
                  }
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: properties.white, size: 27,),
              title: Text(
                'About',
                style: TextStyle(
                  color: properties.white,
                  fontFamily: 'Gotu',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}
