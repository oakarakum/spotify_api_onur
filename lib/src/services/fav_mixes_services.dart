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
        'Bearer BQBVvNIYZckKSSYoqhq4oIYVx82oXKfHo0thtVSpeBZFaOvmyCdi1l9ATlg59xmEKLbjSIksCG6R130IPKNVlf4Pw59n5G1BcZEa27LZCPTeeBX7U2d8WjMqeoo_oBo838_-7vA17_whVhzeZK5ouqnVgj4bMLLZfrfDwNJra_BbDWBh0J5SIO1knheFYOJ7EsrvE9Mtd9cER5vbFkk58OJSk2_yr8dTMkFeRoV6c6VnID6U0KEor7dfvI1q_uO44dY2mlypp_UK8AybpEo4d0KHsjQNZOiWBZBM2EeuSWjt',
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
