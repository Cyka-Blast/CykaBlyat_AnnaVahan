import 'dart:convert';

import 'package:annavahan/properties.dart';
import 'package:annavahan/services/food.dart';
import 'package:http/http.dart' as http;
class Order{
  Map <int,int> food = {}; //<food_id, quantity>
  int clientId = 1;
  int resId = 1;
  double latitude;
  double longitude;
  int price = 0;
  add(Food food){
    if(this.food!=null && this.food.containsKey(food.id)){
      this.food[food.id]+=1;
    }else{
      this.food[food.id]=1;
    }
  }
  remove(Food food){
    if(this.food[food.id]!=0 && this.food.containsKey(food.id)){
      this.food[food.id]-=1;
      if(this.food[food.id]==0){
        this.food.remove(food.id);
      }
    }else{
    }
  }
  int getPrice(List food){
    price = 0;
    if(this.food==null || food == null){
      return 0;
    }
    for (int i=0;i<this.food.length;i++) {
      for (int j = 0; j < food.length; j++) {
        if (food[j].id == this.food.keys.elementAt(i)){
          price += food[j].price*this.food.values.elementAt(i);
        }
      }
    }
    return price;
  }
  post() async{
    Map<String, String>food = {};
    for(int i=0;i<this.food.length;i++){
      food[this.food.keys.elementAt(i).toString()]=this.food.values.elementAt(i).toString();
    }
    Map orderJSON = {
      "client":this.clientId.toString(),
      "restaurant":this.resId.toString(),
      "foodList": food,
      'status': 'pending',
      "latitude":this.latitude.toString(),
      "longitude":this.longitude.toString()
    };
    http.Response response = await http.post('${properties.baseURL}/order',body: jsonEncode(orderJSON),headers: {'Content-Type':'application/json'});
    print(response.statusCode);
    print(response.body);
  }
}

Order order = Order();