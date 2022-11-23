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
        'Bearer BQBuyApt5otuXeGz9L-YcaCM-JtTNfWeNvCgezmJwxE3Rvc-dPo-CG802-LA27vBdzw9tGZZ-SDlpwJX9IrVyGxE74rnID8QXUIxLSGeFYLdtS9-dpp76Z7RyN4qFg1brcuxha7Ehg7h8g0xTMPDkNtg9OrGuEmac5lSe8OBoOhlem35lp0rYoPzUdgzEhWFcpzARx_x6IaXy0cZ8UQqag2FWmdPfy_pgwg1xdrtt0RpKqgxQYAMKcBbTbh_khuJxBO6Uyw3A6R1AnVJZ9aaURv8XbV85BuHlE3oh9GKv-FT',
  };
//BQBlvCXpNT_N7SZaix8xEDGdu3VSrDxS99kRTmPRyizpWAoWewBWpoBskpi14BeVpSsQv1PkpPynF7SImbZDaBqCrYkpIHcbaf7bgOtRlfq7rU80fGEqxoeFY0xyDg3C-3V1KQQ5sum1_wXIP4KVzlswiucCxK9yp7aHKvaBO2TZP9Ov6LuVFOv_-WWrZYbjeljIyPJsJtfACUtzPSj6wgXivqG_PJiGtQ30bQ-0emSTdlLQ1eHtjPxmIgP6SivnwpK3kKTE3CUW2rUSjrM0PGfXa-QYVRwqTeDjeeORtYse
  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  return data = CategoriesModel.fromJson(jsonDecode(res.body));
}
