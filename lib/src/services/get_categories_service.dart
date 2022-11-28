// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/providers/categories_provider.dart';

import '../models/categories_model.dart';

Future<CategoriesModel> getCategoriesService() async {
  CategoriesModel? data;
  CategoriesProvider? categoriesProvider;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQBQCQyBwddtZCKwCngz4LBEegZnwmVJ1UYWMm_DVpFmqnQFrJ2qgapNc6A8MZEMYYjbdt0l0ehcV3mTsXfpbiyosb7oTeRumOhGAlPHs5C-rzdkQHKgKpwNW9gkWRULGsWkaS1rjT62Nf96UPs5P1qlv77j8UnFdv8Lz842QRXJwjTqJVdVqxjqgu0C_sUO-K-RHXwzWK8jV_g-f8i9L0gl4BbykIDLUjZoJAifqog2bpN3LUOiTiQZttYf3yj8GrqxdARUOlDHNST7dajuUq5Vercp0tgYQYUx9ho4HZPm',
  };
  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  return data = CategoriesModel.fromJson(jsonDecode(res.body));
}
