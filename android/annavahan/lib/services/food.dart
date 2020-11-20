import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Food{
  String name;
  int id;
  int price;
  int owner;
  Food({
    this.name,
    this.id,
    this.price,
    this.owner,
  });
}

Future<List<Food>> getFoodRequest()async{
  List<Food> foods = [];
  Response response = await get('http://10.0.2.2:5000/food');
  List data = jsonDecode(response.body);
  for(int i=0;i<data.length;i++){
    Map t_food=data[i];
    Food food = Food(
      id: t_food['id'],
      name: t_food['name'],
      owner: t_food['owner_id'],
      price: t_food['price']
    );
    foods.add(food);
  }
  return foods;
}

