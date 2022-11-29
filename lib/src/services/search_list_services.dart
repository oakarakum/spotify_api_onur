import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQB57huvt3fOKaBQrJivPOnDcyBbRF4mPmLaCAmryrJLNj3Edwdy62SViSUDEiVDLGKtYG2nfCJoYZQFLLjc7lAvSCMpcfNMWSBCr8Z3bIlfvtbezHeqpVs5y73meL2Zhrye_Syv9-53vEY6wvj9CxcnBlF8uxGCPWVT7Afdijs7jOnE6TYD_7MCMYKISMoW31fX4c3_gxbG-PDNQae9G4USoPzJKvps9wr2MfL8xJbpYihXgaXbJI34FDYQImJdleq69Uqv17bA6ebtwfZhzO5l3MUPp8hAktduZmp_T4fP"
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
