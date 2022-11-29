import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQAvCbVCDiIHMYtowa_9jatJmr1bAyo6sBAFGEP5cnWo80XYMyqR_WPPow74HwaGXde3NHUmvXGJHYKC0D4v5JMrFAIuLwoOC7XvbJy7n8PltIjVOaInIsJ5ds5uHV5j7esv3NT9HizVdAr_xRiGWM-EdluZlAxuNNulyclYVrFw_cAiHSpG-Q2xUugiuAv16SIe2EF8gGPXirrukMzqtL9ZiPoBdk2xALu_LoRFyZlW7jjbU0aCY2q5Ult5UZGThlrRajnIZR40IsMmonzVEt-92Z1h-P36b5zRBC_22-SL"
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
