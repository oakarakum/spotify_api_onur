import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/fav_artist_model.dart';

Future<FavArtistModel?> getFavArtistServices() async {
  FavArtistModel? data13;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQBQCQyBwddtZCKwCngz4LBEegZnwmVJ1UYWMm_DVpFmqnQFrJ2qgapNc6A8MZEMYYjbdt0l0ehcV3mTsXfpbiyosb7oTeRumOhGAlPHs5C-rzdkQHKgKpwNW9gkWRULGsWkaS1rjT62Nf96UPs5P1qlv77j8UnFdv8Lz842QRXJwjTqJVdVqxjqgu0C_sUO-K-RHXwzWK8jV_g-f8i9L0gl4BbykIDLUjZoJAifqog2bpN3LUOiTiQZttYf3yj8GrqxdARUOlDHNST7dajuUq5Vercp0tgYQYUx9ho4HZPm',
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
