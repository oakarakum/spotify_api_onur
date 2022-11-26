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
    'Authorization': 'Bearer BQBj4jXiXy9GFg4-kqJKqpHIvolk-TYx3mf-OGKrb_wK6lGI3F_62v4AifFFSSsQcr5H9w9j--zum9AQ4tZmesIOoNkv1QA66woJ9jV-nSacC8JAj4ENVN0IBtbVofXZxUR1QZI0XQX661fmJCVpxGMkH-DsabeaWRNnJOSAqpoicJrqsIK02AaryvzrzmeyXCeInRYLw8T179eJX1dHx6PGbv691r2afrJ9QKEzUMCqk-3U3RiEzkBeWcSSrIRvdzDJ6oFtIjpmCgNm4B4FW396dNlpP5J0NwMFRs0Q340K',
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

 
