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
        'Bearer BQCBqjEcvIj15uxHPQ78nCYAzSeETUCncLb3V38dExjWnCYv_5B8v5N79WOReD80ERVLTrZJbaPBC-rCvYw7Mj_C4H7oOWQ4L2XMyWeef1QfwmR3KxT2y2zhHXK86FUo6Emc4ZGWaCA91UjGIyTtaaFfcvo7YRikORfNrhBQZmIjfF0PV6w2utpWhmh7wvVQv8Kgrat9P4j6GUzku3Wz79Jtoy4qPNA8coIZvgSO4V45z9ShmrEYIX9qazIYzRaqW1OB0jBASpNGerTiw8Hd3ecrNd94pBhSuAhVmJmG376N',
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
