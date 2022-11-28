import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/fav_artist_album_model.dart';

Future<FavArtAlbumModel?> getFavArtAlbumServices() async {
  FavArtAlbumModel? data16;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQC3fBsLuXNGZ3evtIZ4FEzoMqlA45efUH0ivregWghV-xM2gncK5rNdiLErcqpIh446BIwOQlv-lLMqR9iC1rjWqJ3GKUPK_ZC71dH00vbuNf7pHJDNXOSbW6oS7Yzirlf69BVlLEokbaI09ygmwLMQC5YAI06EwdEOxi88dZYaLRYlhOh3YV7tuISA2H91NT2lwR-OpQ2f_fd6S1RjUpssiVf3r7kIe9V_Uot0A5ANYwj4rw_JrRPzRJUb86yd1XRsvzkVWuLPl1EURpRLSu6utsffPAO1_cnFAfKAYCe1',
  };

  var params = {
    'market': 'TR',
    'limit': '5',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse(
      'https://api.spotify.com/v1/artists/09gCQtZS27dL7ekcYLKXsS/albums?$query');
  var res = await http.get(url, headers: headers);

  if (res.statusCode == 200) {
    data16 = FavArtAlbumModel.fromJson(jsonDecode(res.body));
    return data16;
  } else {
    //print("Başarısız");
    return null;
  }
}
