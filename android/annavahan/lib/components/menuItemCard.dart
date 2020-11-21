import 'package:annavahan/properties.dart';
import 'package:annavahan/services/food.dart';
import 'package:annavahan/services/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MenuItemCard extends StatefulWidget {
  Food food;
  List foods;
  MenuItemCard({this.food,this.foods});

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      color: properties.white,
      child: Container(
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              color: Colors.grey,
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.fromLTRB(20,10,0,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25,),
                  Text(
                  '${widget.food.name}',
                  style: TextStyle(
                    fontFamily: 'gotu',
                    fontSize: 19,
                    color: Colors.grey[850],
                  ),
                ),
                  //Text(
                  //  '${food.owner}',
                  // style: TextStyle(
                  //    fontFamily: 'Open Sans',
                  //    fontSize: 13,
                  //    color: Colors.grey[500],
                  //  ),
                  //),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,29,0,0),
              child: FlatButton(
                onPressed: (){
                  order.add(widget.food);
                  setState(() {
                    order.getPrice(widget.foods);
                  });
                },
                child: Column(
                  children: [
                    Text(
                        '${widget.food.price/100}',
                        style: TextStyle(
                          fontFamily: 'Gotu',
                          color: Colors.grey[900],
                          fontSize: 15,
                        ),
                    ),
                    Icon(
                      Icons.add_shopping_cart_outlined,
                      color: properties.accent,
                      size: 22,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
    );


  }
}

