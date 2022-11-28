import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/fav_artist_model.dart';

Future<FavArtistModel?> getFavArtistServices() async {
  FavArtistModel? data13;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQADIX8lTGLaysNIZehQ5sM1rfV0oGJJCXm0eH159FZsVSwguprQ_vkk08MJeIu6VibkrO-GoaAB3hZ45XFw2zY7fEUEKVsU19Rlk-I7SSb8ixBruBoi-bEcoCHmFXkujUiFENFj-MTzNKBiGxEJELEsKNkKRKQFDRLMKy67a99bTEey842lmLnyVseNRMXQuAsNJ0dbL16L5rLJaH1WBPg7SIXzc-hhl8FwcfYObHiTuxlza-ty8A5aPZCtiGiRkk8voB7uzkFYVbyZKaDGK5lC5Db9Q8Mo53T3Vejx7OtY',
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
