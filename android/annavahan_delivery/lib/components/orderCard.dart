import 'package:annavahan_delivery/properties.dart';
import 'package:annavahan_delivery/services/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  OrderCard({this.order});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,'/order',arguments: order);
      },
      child: Card(
        semanticContainer: true,
        color: properties.white,
        child: Container(
          child: Row(
            children: [
              Container(
                height: 80,
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7,),
                    Text(
                      '${order.resName}',
                      style: TextStyle(
                        fontFamily: 'gotu',
                        fontSize: 19,
                        color: Colors.grey[850],
                      ),
                    ),
                    Text(
                      '${order.c_latitude},${order.c_longitude}',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 13,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
      ),
    );
  }
}
