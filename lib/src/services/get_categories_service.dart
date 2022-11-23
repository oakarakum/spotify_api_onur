import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/categories_model.dart';

Future<CategoriesModel> getCategoriesService() async {
  CategoriesModel? data;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQB57VBLHNblP8Z5X6N_VrIQLcnknqK7IjSd1CQTOR1abqYE2nC3xQRZk0KxJjOinUdJHCV-z1SsAFk2BCDCY0at4Flz45ZhK3h9T6hJQ7KPWz8zUFZqupye7Fj2u7CQ1Uee1MWqs2PybpjWpjXPxkUWvcaAHLzmO54vM4xK7N2YJdJiji-y3_SjUN8nU7t3ZyNUj2cQ77VGade-CcKQGR2zBhn4_phX3kqo2XKR1rAnHUzD9b4Y3Ge2kMBI6KL6XG0Ka283qpULoBsN-MCcnDbFi85tuV_w1yTPkgcufbdv',
  };

  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  data = CategoriesModel.fromJson(jsonDecode(res.body));
  return data;
}
