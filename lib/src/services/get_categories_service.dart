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
        'Bearer BQC5o43tD6WQWOKLsF0VhVZF8mxoDBgsX8Og4MShPo1gDY8YqHRzSknYH2TOg1G5CtJJVKEkMHcazrDh-TNWYSlIz10v1fv-oKOklnoKprOFLI6hBhpkaGNk8vB-axcAPgEf_jlhKanlU8NDYYxb-yo5D7D7TOusKVCAbccTQ0aW7qSX035D6NJCaxO8QP60TOajtXnE-Bz8bz5VwC5CvACMv5iEHTUbopXoM6C6MXB7PuaQRRCMUo98VORy0gmy4bMIsaXbsVedOhQUbcxvGjOsNr9NFQmdNa66OQl5yB5j',
  };
//BQBlvCXpNT_N7SZaix8xEDGdu3VSrDxS99kRTmPRyizpWAoWewBWpoBskpi14BeVpSsQv1PkpPynF7SImbZDaBqCrYkpIHcbaf7bgOtRlfq7rU80fGEqxoeFY0xyDg3C-3V1KQQ5sum1_wXIP4KVzlswiucCxK9yp7aHKvaBO2TZP9Ov6LuVFOv_-WWrZYbjeljIyPJsJtfACUtzPSj6wgXivqG_PJiGtQ30bQ-0emSTdlLQ1eHtjPxmIgP6SivnwpK3kKTE3CUW2rUSjrM0PGfXa-QYVRwqTeDjeeORtYse
  var url = Uri.parse('https://api.spotify.com/v1/browse/categories');
  var res = await http.get(url, headers: headers);

  return data = CategoriesModel.fromJson(jsonDecode(res.body));
}
