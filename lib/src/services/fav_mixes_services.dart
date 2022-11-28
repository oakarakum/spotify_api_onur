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
    'Authorization':
        'Bearer BQCBqjEcvIj15uxHPQ78nCYAzSeETUCncLb3V38dExjWnCYv_5B8v5N79WOReD80ERVLTrZJbaPBC-rCvYw7Mj_C4H7oOWQ4L2XMyWeef1QfwmR3KxT2y2zhHXK86FUo6Emc4ZGWaCA91UjGIyTtaaFfcvo7YRikORfNrhBQZmIjfF0PV6w2utpWhmh7wvVQv8Kgrat9P4j6GUzku3Wz79Jtoy4qPNA8coIZvgSO4V45z9ShmrEYIX9qazIYzRaqW1OB0jBASpNGerTiw8Hd3ecrNd94pBhSuAhVmJmG376N',
  };

  var params = {
    'market': 'TR',
    'ids':
        '7ouMYWpwJ422jRcDASZB7P,4VqPOruhp5EdPBeR92t6lQ,2takcwOaAZWiXQijPHIx7B',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/tracks?$query');
  var res = await http.get(url, headers: headers);

  if (res.statusCode == 200) {
    //print(res.body);
    data4 = FavMixModel.fromJson(jsonDecode(res.body));
    return data4;
  } else {
    //print("Action Failed");
    return null;
  }
}



