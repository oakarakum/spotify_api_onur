import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQAo1TSLM_NNKmta_ZdGFeqZjj6tO2liblXLjZyDOv9eGj9GV6RBXimEbDx7w_q6MyPMRSd1pyTQA_N06CJTz-WBwiaagRJF3h2rEnCE_ioQ_CDTiXsFQiCL_jrUwEZACWQG_kfoIOgGcIPnUantu_d3C40ZCdGSi6V1e2FX6lpy8ZpxAEURxfZCdNhaJkYeE_gNR_DfxnZc22szAih5BW2XlQ9cT1m1I7ylzSlNQ0DjrCoRKpsCoZS0N7l5TLQKEdXJBUPVGIvsOEbDAunWc1fXtcu-aST-OnjgwpM74j-4"
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
