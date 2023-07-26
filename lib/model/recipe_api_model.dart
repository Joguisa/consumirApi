import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_https/model/recipe_model.dart';

class RecipeApiModel {

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
                      {"limit": "25", "start": "0", "tag": "list.recipe.popular" });

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '08d935219emsh22a706fa336dfeap128210jsn88abb6901a69',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
      });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']){
      temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}