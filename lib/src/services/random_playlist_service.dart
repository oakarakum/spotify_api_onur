import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/random_playlist_model.dart';
import 'package:spotify_api_onur/src/providers/random_playlist_provider.dart';

Future<RandomPlayListModel?> getRandomPlayListServices() async {
  RandomPlayListModel? data5;
  RandomPlayListProvider? artistProvider;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQBQCQyBwddtZCKwCngz4LBEegZnwmVJ1UYWMm_DVpFmqnQFrJ2qgapNc6A8MZEMYYjbdt0l0ehcV3mTsXfpbiyosb7oTeRumOhGAlPHs5C-rzdkQHKgKpwNW9gkWRULGsWkaS1rjT62Nf96UPs5P1qlv77j8UnFdv8Lz842QRXJwjTqJVdVqxjqgu0C_sUO-K-RHXwzWK8jV_g-f8i9L0gl4BbykIDLUjZoJAifqog2bpN3LUOiTiQZttYf3yj8GrqxdARUOlDHNST7dajuUq5Vercp0tgYQYUx9ho4HZPm',
  };

  var params = {
    'limit': '10',
    'offset': '1',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/users/abc/playlists?$query');
  var res = await http.get(url, headers: headers);

  if (res.statusCode == 200) {
    //print(res.body);
    data5 = RandomPlayListModel.fromJson(jsonDecode(res.body));
    return data5;
  } else {
    //print("Action Failed");
    return null;
  }
}
