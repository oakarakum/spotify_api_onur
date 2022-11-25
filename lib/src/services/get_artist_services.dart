import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/artist_model.dart';
import 'package:spotify_api_onur/src/providers/artist_provider.dart';

Future<ArtistModel?> getArtistServices() async {
  ArtistModel? data3;
  ArtistProvider? artistProvider;

 var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQBVvNIYZckKSSYoqhq4oIYVx82oXKfHo0thtVSpeBZFaOvmyCdi1l9ATlg59xmEKLbjSIksCG6R130IPKNVlf4Pw59n5G1BcZEa27LZCPTeeBX7U2d8WjMqeoo_oBo838_-7vA17_whVhzeZK5ouqnVgj4bMLLZfrfDwNJra_BbDWBh0J5SIO1knheFYOJ7EsrvE9Mtd9cER5vbFkk58OJSk2_yr8dTMkFeRoV6c6VnID6U0KEor7dfvI1q_uO44dY2mlypp_UK8AybpEo4d0KHsjQNZOiWBZBM2EeuSWjt',
  };

  var params = {
    'type': 'artist',
    'limit': '10',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/me/following?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode == 200) {
    //print(res.body);
    data3 = ArtistModel.fromJson(jsonDecode(res.body));
    return data3;
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
    'Authorization': 'Bearer BQBVvNIYZckKSSYoqhq4oIYVx82oXKfHo0thtVSpeBZFaOvmyCdi1l9ATlg59xmEKLbjSIksCG6R130IPKNVlf4Pw59n5G1BcZEa27LZCPTeeBX7U2d8WjMqeoo_oBo838_-7vA17_whVhzeZK5ouqnVgj4bMLLZfrfDwNJra_BbDWBh0J5SIO1knheFYOJ7EsrvE9Mtd9cER5vbFkk58OJSk2_yr8dTMkFeRoV6c6VnID6U0KEor7dfvI1q_uO44dY2mlypp_UK8AybpEo4d0KHsjQNZOiWBZBM2EeuSWjt',
  };

  var params = {
    'type': 'artist',
    'limit': '10',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/me/following?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
}

 */