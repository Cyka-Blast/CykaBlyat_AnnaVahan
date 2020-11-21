import 'dart:convert';

import 'package:annavahan/properties.dart';
import 'package:annavahan/services/food.dart';
import 'package:annavahan/services/order.dart';
import 'package:http/http.dart';

class Business{
  String name;
  double latitude;
  double longitude;
  String address;
  int id;
  List food;
  Business(
  {
    this.name,
    this.address,
    this.latitude,
    this.longitude,
    this.id
  }
  );
}

Future<List<Business>> getRestaurantRequest()async{
  List<Business> restaurants = [];
  Response response = await get('${properties.baseURL}/business');
  List data = jsonDecode(response.body);
  print(data);
  for(int i=0;i<data.length;i++){
    Map t_rest=data[i];
    print(t_rest);
    Business restaurant = Business(
      id: t_rest['id'],
      name: t_rest['name'],
      latitude: double.parse(t_rest['latitude']),
      longitude: double.parse(t_rest['longitude']),
      address: t_rest['address'],
    );
    restaurants.add(restaurant);
  }
  return restaurants;
}
