import 'package:annavahan/properties.dart';
import 'package:annavahan/services/Business.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RestaurantCard extends StatelessWidget {
  Business restaurant;
  RestaurantCard({this.restaurant});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,'/restaurant',arguments: restaurant);
      },
      child: Card(
        semanticContainer: true,
        color: properties.white,
        child: Container(
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7,),
                    Text(
                      '${restaurant.name}',
                      style: TextStyle(
                        fontFamily: 'gotu',
                        fontSize: 19,
                        color: Colors.grey[850],
                      ),
                    ),
                    Text(
                      '${restaurant.address}',
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

