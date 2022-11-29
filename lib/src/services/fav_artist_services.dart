import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/fav_artist_model.dart';

Future<FavArtistModel?> getFavArtistServices() async {
  FavArtistModel? data13;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQAvCbVCDiIHMYtowa_9jatJmr1bAyo6sBAFGEP5cnWo80XYMyqR_WPPow74HwaGXde3NHUmvXGJHYKC0D4v5JMrFAIuLwoOC7XvbJy7n8PltIjVOaInIsJ5ds5uHV5j7esv3NT9HizVdAr_xRiGWM-EdluZlAxuNNulyclYVrFw_cAiHSpG-Q2xUugiuAv16SIe2EF8gGPXirrukMzqtL9ZiPoBdk2xALu_LoRFyZlW7jjbU0aCY2q5Ult5UZGThlrRajnIZR40IsMmonzVEt-92Z1h-P36b5zRBC_22-SL',
  };

  var params = {
    'type': 'artist',
    'limit': '20',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/me/following?$query');
  var res = await http.get(url, headers: headers);

  return data13 = FavArtistModel.fromJson(jsonDecode(res.body));
}
