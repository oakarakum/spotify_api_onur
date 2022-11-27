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
        'Bearer BQBF_60fNJehecQKdwqlk_VvxvjZWm-pU8SOkMRSRFt2zumMbmu1Fhi4HiGP0TbwaGGyD6wZi9wzYzibfqGo1XXea0pT9D0jMPXmYHwtktj0DuLoPjIKjAVgVVLSC4srtaRecVcHK5pG47dh6uEBzpnWzPT2VEJRrziuuQnLb_5bXfholxh4EhbotKUchGvQ01zBvWjez6clOiFDTY-4L3F_jOosumkmO619Z1pDYzNbGlbP0CG8whkGoESp6wbUezXxCGHXLtjzI0IzOgo4zLNG8y9g_lPZv2jN2f318Y7E',
  };
//BQBlvCXpNT_N7SZaix8xEDGdu3VSrDxS99kRTmPRyizpWAoWewBWpoBskpi14BeVpSsQv1PkpPynF7SImbZDaBqCrYkpIHcbaf7bgOtRlfq7rU80fGEqxoeFY0xyDg3C-3V1KQQ5sum1_wXIP4KVzlswiucCxK9yp7aHKvaBO2TZP9Ov6LuVFOv_-WWrZYbjeljIyPJsJtfACUtzPSj6wgXivqG_PJiGtQ30bQ-0emSTdlLQ1eHtjPxmIgP6SivnwpK3kKTE3CUW2rUSjrM0PGfXa-QYVRwqTeDjeeORtYse
  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  return data = CategoriesModel.fromJson(jsonDecode(res.body));
}
