// CLIENT SIDE
import 'dart:convert';

import 'package:dart_async_project/meals_model.dart';
import 'package:dio/dio.dart';

var dio = Dio();

Future<void> fetchData() async {
  dio.options.receiveTimeout = Duration(milliseconds: 200);
  var data = await dio.get(
      "https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast");
  // print("${data.runtimeType}");
  print(data.statusCode);
  var decodedData = jsonDecode(data.toString());
  // print("${decodedData.runtimeType}");
  // for (var mapData in decodedData["meals"]) {
  //   print(mapData["strMel"] + " : " + mapData["idMeal"]);
  // }

  var mealsModel = MealListModel.fromJson(decodedData);
  for (var meal in mealsModel.meals) {
    print("${meal.strMeal} : ${meal.idMeal}");
  }
}

Future<void> postData() async {
  var reponse = await dio.post(
    "https://api.restful-api.dev/objects",
    data: {
      "name": "Apple MacBook Pro 16",
      "data": {
        "year": 2019,
        "price": 1849.99,
        "CPU model": "Intel Core i9",
        "Hard disk size": "1 TB"
      }
    },
  );

  print(reponse.statusCode);
}

void main() {
  // fetchData();
  postData();
}
