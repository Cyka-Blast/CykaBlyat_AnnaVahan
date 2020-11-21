import 'package:annavahan/components/appbar.dart';
import 'package:annavahan/components/cartItemCard.dart';
import 'package:annavahan/components/navdrawer.dart';
import 'package:annavahan/services/Business.dart';
import 'package:annavahan/services/client.dart';
import 'package:annavahan/services/order.dart';
import 'package:flutter/material.dart';
import 'package:annavahan/properties.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    Business restaurant = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: properties.white,
      appBar: appBar,
      drawer: NavDrawer(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          color: properties.white,
          child: Center(
            child: Container(
              width: 370,
              child: ListView.builder(
                itemCount: order.food.length,
                itemBuilder: (context, index) {
                  int key = order.food.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 0.0,
                    ),
                    child: Container(
                      height: 120,
                      child: CartItemCard(restaurant: restaurant, orderKey: key, refresh: (){setState(() {});}),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: properties.primary,
        items: [
          BottomNavigationBarItem(icon: FlatButton.icon(
            label: Text(
                'Clear Cart',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.bold,
                  color: properties.white,
                  fontSize: 14,
                )
            ),
            icon: Icon(
              Icons.remove_shopping_cart,
              color: properties.white,
            ),
            onPressed: order.getPrice(restaurant.food)==0? null:() async{
              AlertDialog alert = AlertDialog(
                title: Text("Cancel Order?"),
                content: Text("This will clear all the items in your cart."),
                actions: [
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      order.food = {};
                      order.getPrice(restaurant.food);
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          ),
            label: '',
          ),
          BottomNavigationBarItem(icon: FlatButton.icon(
            label: Text(
                'Confirm Order',
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.bold,
                  color: properties.white,
                  fontSize: 14,
                )
            ),
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              color: properties.white,
            ),
            onPressed: order.getPrice(restaurant.food)==0? null:() async{
              AlertDialog alert = AlertDialog(
                title: Text("${'Proceed For Payment?'}"),
                content: Text("Total: Rs. ${order.getPrice(restaurant.food)/100}"),
                actions: [
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      order.longitude=customer.longitude;
                      order.latitude=customer.latitude;
                      order.post();
                      order.food = {};
                      setState(() {});
                      AlertDialog alert = AlertDialog(
                        title: Text("${'Order Confirmed'}"),
                        content: Text("It'll be delivered soon."),
                        actions: [
                          FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
          ),
            label: ''
          ),

        ],
      ),
      persistentFooterButtons: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: 400,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cart Total:',
                    style: TextStyle(
                      fontFamily: 'Gotu',
                      color: Colors.grey[800],
                      fontSize: 20,
                    )
                ),
                Text('₹ ${order.price/100}',
                    style: TextStyle(
                      fontFamily: 'Gotu',
                      color: Colors.grey[800],
                      fontSize: 20,
                    )
                ),
              ]
          ),
        )
      ],
    );
  }
}
