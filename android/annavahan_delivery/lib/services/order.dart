import 'dart:convert';

import 'package:annavahan_delivery/properties.dart';
import 'package:annavahan_delivery/services/business.dart';
import 'package:http/http.dart';

class Order{
  int id;
  int clientId;
  int resId;
  String resName;
  String c_latitude;
  String c_longitude;
  String r_latitude;
  String r_longitude;


  Order(
      {
        this.id,
        this.clientId,
        this.resId,
        this.resName,
        this.c_latitude,
        this.c_longitude,
        this.r_latitude,
        this.r_longitude
      }
      );
}

Future<List<Order>> getOrderRequest()async{
  List<Order> restaurants = [];
  Response response = await get('${properties.baseURL}/order');
  List data = jsonDecode(response.body);
  List restaurantList = await getRestaurantRequest();
  for(int i=0;i<data.length;i++){
    Map t_order=data[i];
    String r_lat;
    String r_long;
    String r_name;
    for(int i=0; i<restaurantList.length;i++){
      if (t_order['bus_id']==restaurantList[i].id){
        r_lat = restaurantList[i].latitude;
        r_long=restaurantList[i].longitude;
        r_name=restaurantList[i].name;
      }
    }
    Order order = Order(
      id: t_order['id'],
      clientId: t_order['client_id'],
      resId: t_order['bus_id'],
      resName: r_name,
      c_latitude: t_order['c_latitude'],
      c_longitude: t_order['c_longitude'],
      r_latitude: r_lat,
      r_longitude: r_long,
    );
    print(t_order['deli_id']);
    if(t_order['deli_id']==1) {
       restaurants.add(order);
    }
  }
  print('updated');
  return restaurants;
}
