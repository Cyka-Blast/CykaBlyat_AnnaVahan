import 'dart:convert';

import 'package:http/http.dart';

class Business {
  String name;
  String latitude;
  String longitude;
  String address;
  int id;
  List food;
  Business({this.name, this.address, this.latitude, this.longitude, this.id});
}

Future<List<Business>> getRestaurantRequest() async {
  List<Business> restaurants = [];
  Response response = await get('http://10.0.2.2:5000/business');
  List data = jsonDecode(response.body);
  for (int i = 0; i < data.length; i++) {
    Map t_rest = data[i];
    Business restaurant = Business(
      id: t_rest['id'],
      name: t_rest['name'],
      latitude: t_rest['latitude'],
      longitude: t_rest['longitude'],
      address: t_rest['address'],
    );
    restaurants.add(restaurant);
  }
  return restaurants;
}
