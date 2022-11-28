import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQABZNXGEu-AS4iLJn83ccQU2uoabyJQ0nqbGJSoA29DpCU3Os6X0N0-GoWeVLhAIto7lsGQEiSgSSNyrRtCoRzUZB59AsTznPVBiSrtA3v0siGLeRAbbnJiray-vUQ-B07Ml7si5zUbNzYvN5RvbrT5cRynzLC2yXPOZVUUTsCWixAccEqye4Y6iNnODuaGh78bW7aaPVQs7H0p5Yyol5hprHd8jrYMSEZPe0GWF2RR5R4aATWiXPAcYGEVQqyALhr4q4MvjB4x3rA0dBooLNpGrMMy29u-6mqCa9LMRfvr"
}));

Future<SearchModels?> getSearchDataService(String query) async {
  SearchModels searchlist = SearchModels();
  try {
    try {
      final response = await _dio.get(
          "search?q=$query&type=track%2Cartist&market=TR&limit=10&offset=5");

      searchlist = SearchModels.fromJson(response.data);
      print(searchlist.artists);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return searchlist;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
