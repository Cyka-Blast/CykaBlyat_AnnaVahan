import 'package:annavahan/services/Business.dart';
import 'package:annavahan/services/food.dart';
import 'package:annavahan/services/order.dart';
import 'package:flutter/material.dart';
import 'package:annavahan/properties.dart';

class CartItemCard extends StatefulWidget {
  final Business restaurant ;
  final int orderKey;
  final Function refresh;
  CartItemCard({this.restaurant, this.orderKey, this.refresh});
  @override
  _CartItemCardState createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    String name;
    int quantity;
    int price;
    List food = widget.restaurant.food;
    Food curFood;
    for(int i=0;i<food.length;i++){
      if(food[i].id==widget.orderKey){
        curFood = food[i];
        name=food[i].name;
        quantity=order.food[widget.orderKey];
        price=food[i].price*quantity;
      }
    }
    return Dismissible(
      key: Key('${widget.orderKey}'),
        onDismissed: (direction) {
          setState(() {
                order.food.remove(widget.orderKey);
                order.getPrice(food);
                widget.refresh();
          });
        },
      child: Card(
//      color: Colors.grey[850],
        child: Center(
          child: ListTile(
            onTap: () async{
            },
            title: Text(
              '$name',
              style: TextStyle(
                fontFamily: 'gotu',
                fontSize: 19,
                color: Colors.grey[850],
              ),
            ),
            subtitle: Text(
              'Rs. ${price/100}',
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 13,
                color: Colors.grey[500],
              ),
            ),
            trailing: Container(
              width: 110,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        order.add(curFood);
                        order.getPrice(food);
                        widget.refresh();
                      });
                    },
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontFamily: 'gotu',
                      fontSize: 19,
                      color: Colors.grey[850],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        quantity-=1;
                        order.remove(curFood);
                        order.getPrice(food);
                        widget.refresh();
                      });
                    },
                  ),
                ],
              ),
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}