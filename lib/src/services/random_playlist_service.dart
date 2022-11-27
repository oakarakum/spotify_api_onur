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
    'Authorization': 'Bearer BQC5o43tD6WQWOKLsF0VhVZF8mxoDBgsX8Og4MShPo1gDY8YqHRzSknYH2TOg1G5CtJJVKEkMHcazrDh-TNWYSlIz10v1fv-oKOklnoKprOFLI6hBhpkaGNk8vB-axcAPgEf_jlhKanlU8NDYYxb-yo5D7D7TOusKVCAbccTQ0aW7qSX035D6NJCaxO8QP60TOajtXnE-Bz8bz5VwC5CvACMv5iEHTUbopXoM6C6MXB7PuaQRRCMUo98VORy0gmy4bMIsaXbsVedOhQUbcxvGjOsNr9NFQmdNa66OQl5yB5j',
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