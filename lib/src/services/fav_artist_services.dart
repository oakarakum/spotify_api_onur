import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/fav_artist_model.dart';

Future<FavArtistModel?> getFavArtistServices() async {
  FavArtistModel? data13;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQABZNXGEu-AS4iLJn83ccQU2uoabyJQ0nqbGJSoA29DpCU3Os6X0N0-GoWeVLhAIto7lsGQEiSgSSNyrRtCoRzUZB59AsTznPVBiSrtA3v0siGLeRAbbnJiray-vUQ-B07Ml7si5zUbNzYvN5RvbrT5cRynzLC2yXPOZVUUTsCWixAccEqye4Y6iNnODuaGh78bW7aaPVQs7H0p5Yyol5hprHd8jrYMSEZPe0GWF2RR5R4aATWiXPAcYGEVQqyALhr4q4MvjB4x3rA0dBooLNpGrMMy29u-6mqCa9LMRfvr',
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
