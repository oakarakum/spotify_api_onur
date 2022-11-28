import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/fav_mix_model.dart';
import 'package:spotify_api_onur/src/providers/fav_mixes_provider.dart';

Future<FavMixModel?> getFavMixesServices() async {
  FavMixModel? data4;
  FavouriteMixesProvider? favouriteMixesProvider;
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQBQCQyBwddtZCKwCngz4LBEegZnwmVJ1UYWMm_DVpFmqnQFrJ2qgapNc6A8MZEMYYjbdt0l0ehcV3mTsXfpbiyosb7oTeRumOhGAlPHs5C-rzdkQHKgKpwNW9gkWRULGsWkaS1rjT62Nf96UPs5P1qlv77j8UnFdv8Lz842QRXJwjTqJVdVqxjqgu0C_sUO-K-RHXwzWK8jV_g-f8i9L0gl4BbykIDLUjZoJAifqog2bpN3LUOiTiQZttYf3yj8GrqxdARUOlDHNST7dajuUq5Vercp0tgYQYUx9ho4HZPm',
  };

  var params = {
    'market': 'TR',
    'ids':
        '7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/tracks?$query');
  var res = await http.get(url, headers: headers);

  if (res.statusCode == 200) {
    //print(res.body);
    data4 = FavMixModel.fromJson(jsonDecode(res.body));
    return data4;
  } else {
    //print("Action Failed");
    return null;
  }
}



