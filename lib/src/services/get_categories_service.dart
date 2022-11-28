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
        'Bearer BQABZNXGEu-AS4iLJn83ccQU2uoabyJQ0nqbGJSoA29DpCU3Os6X0N0-GoWeVLhAIto7lsGQEiSgSSNyrRtCoRzUZB59AsTznPVBiSrtA3v0siGLeRAbbnJiray-vUQ-B07Ml7si5zUbNzYvN5RvbrT5cRynzLC2yXPOZVUUTsCWixAccEqye4Y6iNnODuaGh78bW7aaPVQs7H0p5Yyol5hprHd8jrYMSEZPe0GWF2RR5R4aATWiXPAcYGEVQqyALhr4q4MvjB4x3rA0dBooLNpGrMMy29u-6mqCa9LMRfvr',
  };
  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  return data = CategoriesModel.fromJson(jsonDecode(res.body));
}
