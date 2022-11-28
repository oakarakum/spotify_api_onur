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
        'Bearer BQCBqjEcvIj15uxHPQ78nCYAzSeETUCncLb3V38dExjWnCYv_5B8v5N79WOReD80ERVLTrZJbaPBC-rCvYw7Mj_C4H7oOWQ4L2XMyWeef1QfwmR3KxT2y2zhHXK86FUo6Emc4ZGWaCA91UjGIyTtaaFfcvo7YRikORfNrhBQZmIjfF0PV6w2utpWhmh7wvVQv8Kgrat9P4j6GUzku3Wz79Jtoy4qPNA8coIZvgSO4V45z9ShmrEYIX9qazIYzRaqW1OB0jBASpNGerTiw8Hd3ecrNd94pBhSuAhVmJmG376N',
  };
  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  return data = CategoriesModel.fromJson(jsonDecode(res.body));
}
