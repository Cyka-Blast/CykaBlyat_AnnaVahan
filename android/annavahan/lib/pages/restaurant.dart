import 'package:annavahan/components/appbar.dart';
import 'package:annavahan/components/homeBody.dart';
import 'package:annavahan/components/menuItemCard.dart';
import 'package:annavahan/components/navdrawer.dart';
import 'package:annavahan/properties.dart';
import 'package:annavahan/services/Business.dart';
import 'package:annavahan/services/food.dart';
import 'package:annavahan/services/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  Widget build(BuildContext context) {
    Business restaurant = ModalRoute.of(context).settings.arguments;
    order.food = {};
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          color: properties.white,
          child: Column(
            children: [
              Text('${restaurant.name}',
                style: TextStyle(
                  color: properties.accent,
                  fontFamily: 'Gotu',
                  fontSize: 25,
                ),
              ),
              Center(
                child: Container(
                  width: 370,
                  height: 570,
                  child: FutureBuilder(
                    future: getFoodRequest(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Text('Loading...');
                      }else{
                        if(snapshot.hasError){
                          print(snapshot.error.toString());
                          return Text('error');
                        }else{
                          var foods = [];
                          for(int i=0;i<snapshot.data.length;i++){
                            if (snapshot.data[i].owner==restaurant.id){
                              foods.add(snapshot.data[i]);
                            }
                          }
                          restaurant.food = foods;
                          return ListView.builder(
                            itemCount: foods.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 0.0,
                                ),
                                child: Container(
                                  height: 120,
                                  child: MenuItemCard(food: foods[index], foods: foods),
                                ),
                              );
                            },
                          );
                        }
                      }
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: NavDrawer(),
      backgroundColor: properties.primary,
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
          width: 400,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 200,
                  child: Center(
                    child: FlatButton.icon(
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: properties.white,
                      ),
                      label: Text(
                          'Checkout',
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold,
                            color: properties.white,
                            fontSize: 15,
                          )
                      ),
                      onPressed: () async{
                        await Navigator.pushNamed(context, '/cart', arguments: restaurant);
                      },
                    ),
                  ),
                ),
              ]
          ),
        )
      ],
    );
  }
}
