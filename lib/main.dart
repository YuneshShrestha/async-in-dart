import 'dart:convert';

import 'package:dart_async_project/model.dart';
import 'package:dio/dio.dart';

Future<void> getMainIngredient() async {
  final dio = Dio();
  // dio.options.connectTimeout = Duration(milliseconds: 5);
  dio.options.receiveTimeout = Duration(microseconds: 3);
  var data = await dio.get(
    "http://www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast",
  );
  print("Run Time Type: ${data.runtimeType}");
// From Internet JSON
  var decodedData = jsonDecode(data.toString());
  // print("Run Time Type: ${decodedData.runtimeType}");
  ResponseModel responseModel = ResponseModel.fromJson(decodedData);

  for (var items in responseModel.meals) {
    print("${items.strMeal} : ${items.idMeal}");
  }
}

Future<void> postMethod() async {
  final dio = Dio();
  var response = await dio.post(
    "https://api.restful-api.dev/objects",
    data: {
      "name": "YUNESH",
      "data": {
        "year": 2019,
        "price": 1849.99,
        "CPU model": "Intel Core i9",
        "Hard disk size": "1 TB"
      }
    },
  );
  print(response);

//   print("Run Time Type: ${data.runtimeType}");
// // From Internet JSON
//   var decodedData = jsonDecode(data.toString());
//   // print("Run Time Type: ${decodedData.runtimeType}");
//   ResponseModel responseModel = ResponseModel.fromJson(decodedData);

//   for (var items in responseModel.meals) {
//     print("${items.strMeal} : ${items.idMeal}");
//   }
}

void main() {
  getMainIngredient();
}
