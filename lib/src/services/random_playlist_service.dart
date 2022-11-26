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
    'Authorization': 'Bearer BQBj4jXiXy9GFg4-kqJKqpHIvolk-TYx3mf-OGKrb_wK6lGI3F_62v4AifFFSSsQcr5H9w9j--zum9AQ4tZmesIOoNkv1QA66woJ9jV-nSacC8JAj4ENVN0IBtbVofXZxUR1QZI0XQX661fmJCVpxGMkH-DsabeaWRNnJOSAqpoicJrqsIK02AaryvzrzmeyXCeInRYLw8T179eJX1dHx6PGbv691r2afrJ9QKEzUMCqk-3U3RiEzkBeWcSSrIRvdzDJ6oFtIjpmCgNm4B4FW396dNlpP5J0NwMFRs0Q340K',
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
    print("Action Failed");
    return null;
  }
}