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
        'Bearer BQAvCbVCDiIHMYtowa_9jatJmr1bAyo6sBAFGEP5cnWo80XYMyqR_WPPow74HwaGXde3NHUmvXGJHYKC0D4v5JMrFAIuLwoOC7XvbJy7n8PltIjVOaInIsJ5ds5uHV5j7esv3NT9HizVdAr_xRiGWM-EdluZlAxuNNulyclYVrFw_cAiHSpG-Q2xUugiuAv16SIe2EF8gGPXirrukMzqtL9ZiPoBdk2xALu_LoRFyZlW7jjbU0aCY2q5Ult5UZGThlrRajnIZR40IsMmonzVEt-92Z1h-P36b5zRBC_22-SL',
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
