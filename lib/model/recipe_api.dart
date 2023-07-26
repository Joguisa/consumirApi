import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_https/model/recipe_model.dart';

class RecipeApi {

//   const req = unirest('GET', 'https://yummly2.p.rapidapi.com/feeds/list');

// req.query({
// 	limit: '24',
// 	start: '0'
// });

// req.headers({
// 	'X-RapidAPI-Key': '08d935219emsh22a706fa336dfeap128210jsn88abb6901a69',
// 	'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
// });

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', 
        {
	'limit': '24',
	'start': '0'
});
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