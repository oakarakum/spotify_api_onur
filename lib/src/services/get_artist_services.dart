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
    'Authorization': 'Bearer BQBF_60fNJehecQKdwqlk_VvxvjZWm-pU8SOkMRSRFt2zumMbmu1Fhi4HiGP0TbwaGGyD6wZi9wzYzibfqGo1XXea0pT9D0jMPXmYHwtktj0DuLoPjIKjAVgVVLSC4srtaRecVcHK5pG47dh6uEBzpnWzPT2VEJRrziuuQnLb_5bXfholxh4EhbotKUchGvQ01zBvWjez6clOiFDTY-4L3F_jOosumkmO619Z1pDYzNbGlbP0CG8whkGoESp6wbUezXxCGHXLtjzI0IzOgo4zLNG8y9g_lPZv2jN2f318Y7E',
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
    //print("Action Failed");
    return null;
  }
}

 
