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
    'Authorization': 'Bearer BQBj4jXiXy9GFg4-kqJKqpHIvolk-TYx3mf-OGKrb_wK6lGI3F_62v4AifFFSSsQcr5H9w9j--zum9AQ4tZmesIOoNkv1QA66woJ9jV-nSacC8JAj4ENVN0IBtbVofXZxUR1QZI0XQX661fmJCVpxGMkH-DsabeaWRNnJOSAqpoicJrqsIK02AaryvzrzmeyXCeInRYLw8T179eJX1dHx6PGbv691r2afrJ9QKEzUMCqk-3U3RiEzkBeWcSSrIRvdzDJ6oFtIjpmCgNm4B4FW396dNlpP5J0NwMFRs0Q340K',
  };

  var params = {
    'market': 'TR',
    'ids': '7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/tracks?$query');
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


/* 

import 'package:http/http.dart' as http;

void main() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQBj4jXiXy9GFg4-kqJKqpHIvolk-TYx3mf-OGKrb_wK6lGI3F_62v4AifFFSSsQcr5H9w9j--zum9AQ4tZmesIOoNkv1QA66woJ9jV-nSacC8JAj4ENVN0IBtbVofXZxUR1QZI0XQX661fmJCVpxGMkH-DsabeaWRNnJOSAqpoicJrqsIK02AaryvzrzmeyXCeInRYLw8T179eJX1dHx6PGbv691r2afrJ9QKEzUMCqk-3U3RiEzkBeWcSSrIRvdzDJ6oFtIjpmCgNm4B4FW396dNlpP5J0NwMFRs0Q340K',
  };

  var params = {
    'market': 'TR',
    'ids': '7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/tracks?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
}

 */
