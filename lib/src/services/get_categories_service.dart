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
        'Bearer BQBEAuxoKD1NdVvQOaaM6T6R8KLdZTm_8afJqkZz3ubsl5eBK0VrbHZeszb9RMMOxkAePQ259lbkwbZpied-fAsxtbJml5DqJHmekiRfoIN7BKaZRaWdDoemGZlQe4L5IlHzvlmMii8Ak12ILKkrRED6wtzmILqOrFbR66j5ogUu-MTPXAR74W5aCL_sT7I8sHU8_a_rrjfASL8QWQew3KQ7YJsKT_QvrcUgKo8vWtlP_t39stgUojiKFGYskGDiD_cq0OV-m3928DCXROn1WJq6w0LwQ3efznL3Mk1vv9y4',
  };
//BQBlvCXpNT_N7SZaix8xEDGdu3VSrDxS99kRTmPRyizpWAoWewBWpoBskpi14BeVpSsQv1PkpPynF7SImbZDaBqCrYkpIHcbaf7bgOtRlfq7rU80fGEqxoeFY0xyDg3C-3V1KQQ5sum1_wXIP4KVzlswiucCxK9yp7aHKvaBO2TZP9Ov6LuVFOv_-WWrZYbjeljIyPJsJtfACUtzPSj6wgXivqG_PJiGtQ30bQ-0emSTdlLQ1eHtjPxmIgP6SivnwpK3kKTE3CUW2rUSjrM0PGfXa-QYVRwqTeDjeeORtYse
  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  return data = CategoriesModel.fromJson(jsonDecode(res.body));
}
