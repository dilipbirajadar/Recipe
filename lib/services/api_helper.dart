import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../models/recipe.dart';

class ApiHelper {
  final String urlExplore =
      "https://flutter-receipe-default-rtdb.firebaseio.com/recipes.json";

  Future<List<RecipeData>> getRecipe(bool isFav) async {
    // use async to define asyn functions in dart
    Response response = await get(Uri.parse(
        urlExplore)); // get request , await waits  till the response is available
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      // 200 -valid response
      // convert response body into dart based List
      List<dynamic> body = jsonDecode(response.body);
      print(
          body); // using dart api to convert json based collection to List in dart
      List<RecipeData> clients =
          body.map((dynamic data) => RecipeData.fromJson(data)).toList();
      print(
          clients); // using factory methods to generate Dart objects from json object
      if (isFav) {
        clients = clients.where((i) => i.isFavorite).toList();
      }

      return clients;
    } else {
      // error processing request
      throw "unable to fetch details";
    }
  }

  // Future<Response> postQuery(RecipeData recipeData) async {
  //   Response response = await post(
  //       Uri.parse(
  //           "https://foodie-zone-d6d6f-default-rtdb.firebaseio.com/requests.json"),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(
  //           {'email': customerQuery.email, 'query': customerQuery.query}));
  //   return response;
  // }

  Future<void> updateCurrentRecipeInformation(
      RecipeData recipeData, int index) async {
    String urlString =
        "https://flutter-receipe-default-rtdb.firebaseio.com/recipes/$index.json";
    final url = Uri.parse(urlString);
    final headers = {"Content-type": "application/json"};
    final json = jsonEncode(recipeData.toJson());
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}
