import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQBu_jifKNS-_rcTTV_hmC_CWle_bXkRK_1-P5VUZ8PMLkUIbENZ5wPLQuxSyLE5CEPTm4StK7_-iCe_cqQuStGVMfFYO4eGNfXp-kA2cx6_2gbxjTZYTrSI2mAnZOlS15mqzHwBiPnisq9jzKbZG4m5XhGiyAdG_nw5w29lsaY4M5GHPz6pxVzJBs8b9T2VYJ_7ciRQRfa97sHvRZroQPM9BM7K7pcaw0c1CeIJAxsfbf0WIHi8QoUoqYLO8KQof6I8_H7PlvGtsv5BUE0K8vX9ARW58Bxjf6NPxQmZNxfYFfgjKWunsOittzmC0stsMaEsRxqdw8Pa"
}));

Future<SearchModels?> getSearchDataService() async {
  SearchModels searchlist = SearchModels();
  try {
    try {
      final response = await _dio.get(
          "search?q=remaster%2520track%3ADoxy%2520artist%3AMiles%2520Davis&type=track%2Cartist&market=TR&limit=10&offset=5");

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
