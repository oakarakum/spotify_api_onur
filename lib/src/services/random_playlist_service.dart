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
    'Authorization': 'Bearer BQBF_60fNJehecQKdwqlk_VvxvjZWm-pU8SOkMRSRFt2zumMbmu1Fhi4HiGP0TbwaGGyD6wZi9wzYzibfqGo1XXea0pT9D0jMPXmYHwtktj0DuLoPjIKjAVgVVLSC4srtaRecVcHK5pG47dh6uEBzpnWzPT2VEJRrziuuQnLb_5bXfholxh4EhbotKUchGvQ01zBvWjez6clOiFDTY-4L3F_jOosumkmO619Z1pDYzNbGlbP0CG8whkGoESp6wbUezXxCGHXLtjzI0IzOgo4zLNG8y9g_lPZv2jN2f318Y7E',
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