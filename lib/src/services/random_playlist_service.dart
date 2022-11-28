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
        'Bearer BQABZNXGEu-AS4iLJn83ccQU2uoabyJQ0nqbGJSoA29DpCU3Os6X0N0-GoWeVLhAIto7lsGQEiSgSSNyrRtCoRzUZB59AsTznPVBiSrtA3v0siGLeRAbbnJiray-vUQ-B07Ml7si5zUbNzYvN5RvbrT5cRynzLC2yXPOZVUUTsCWixAccEqye4Y6iNnODuaGh78bW7aaPVQs7H0p5Yyol5hprHd8jrYMSEZPe0GWF2RR5R4aATWiXPAcYGEVQqyALhr4q4MvjB4x3rA0dBooLNpGrMMy29u-6mqCa9LMRfvr',
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
