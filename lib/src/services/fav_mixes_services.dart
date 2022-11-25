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
        'Bearer BQDCMc2tPcZ60ZlgUNoeemv3MhGteWxx_KtU5WbrqpS2bEuWfFGZgLGlx1dTOq9iVb00nSudSHz34zaeTPJTyX3HYRoo86Rmh6t-JthtTmILAmYfw4L_v2-CNU0rQpgdrc6OEaNIO5YGZ9ubvfVBjq_mY9p1tR76GEE7REeHPDrbx0ach-zZ75VeyAkF89pGnFGr9x-_cdo64F1tqeRxO2VByBaPQZTaVVHcDTt18gi2gMcnCQE20yNHxoZVmoO-sL6hIhMfOsKi26rKVVNYLS6XxUuY5yZghWzMq7tyJ9qn',
  };

  var params = {
    'type': 'artist',
    'after': '0I2XqVXqHScXjHhk6AYYRe',
    'limit': '10',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/me/following?$query');
  var res = await http.get(url, headers: headers);

  if (res.statusCode == 200) {
    print(res.body);
    data4 = FavMixModel.fromJson(jsonDecode(res.body));
    return data4;
  } else {
    print("Action Failed");
    return null;
  }
}
