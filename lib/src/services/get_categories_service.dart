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
        'Bearer BQB6rpswmIoDptiUicQo3SyvrQQX0-vn6SKnQd2LRfaPDESY0MTnCrkKGFpDttKnUy4eu0vixVoOm8kLH3F0RCYd7jKWSvJlc-adSkeLuq_zL_rj3lQBJ7fnWQA6wOC3NzOZAJIalEuQhs0Bah20hZj2fwRRFzwVmE1TVulyGiQ-Z4AmACXZ5wWqd0Z483wQ_APyEgJYvBvRCYrs1Jjjww1MDA5hXSQDErM4M07xPKd9XVWaarvQjCc0UDI3Vyn_z6_0Y2er1QK9VlbXgWyMXyTm_9sHqyRZJHLSz_i6GkKs',
  };
//BQBlvCXpNT_N7SZaix8xEDGdu3VSrDxS99kRTmPRyizpWAoWewBWpoBskpi14BeVpSsQv1PkpPynF7SImbZDaBqCrYkpIHcbaf7bgOtRlfq7rU80fGEqxoeFY0xyDg3C-3V1KQQ5sum1_wXIP4KVzlswiucCxK9yp7aHKvaBO2TZP9Ov6LuVFOv_-WWrZYbjeljIyPJsJtfACUtzPSj6wgXivqG_PJiGtQ30bQ-0emSTdlLQ1eHtjPxmIgP6SivnwpK3kKTE3CUW2rUSjrM0PGfXa-QYVRwqTeDjeeORtYse
  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  return data = CategoriesModel.fromJson(jsonDecode(res.body));
}
