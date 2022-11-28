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
    'Authorization':
        'Bearer BQC3fBsLuXNGZ3evtIZ4FEzoMqlA45efUH0ivregWghV-xM2gncK5rNdiLErcqpIh446BIwOQlv-lLMqR9iC1rjWqJ3GKUPK_ZC71dH00vbuNf7pHJDNXOSbW6oS7Yzirlf69BVlLEokbaI09ygmwLMQC5YAI06EwdEOxi88dZYaLRYlhOh3YV7tuISA2H91NT2lwR-OpQ2f_fd6S1RjUpssiVf3r7kIe9V_Uot0A5ANYwj4rw_JrRPzRJUb86yd1XRsvzkVWuLPl1EURpRLSu6utsffPAO1_cnFAfKAYCe1',
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
