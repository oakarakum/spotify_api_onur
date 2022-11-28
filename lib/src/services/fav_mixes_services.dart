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
        'Bearer BQC3fBsLuXNGZ3evtIZ4FEzoMqlA45efUH0ivregWghV-xM2gncK5rNdiLErcqpIh446BIwOQlv-lLMqR9iC1rjWqJ3GKUPK_ZC71dH00vbuNf7pHJDNXOSbW6oS7Yzirlf69BVlLEokbaI09ygmwLMQC5YAI06EwdEOxi88dZYaLRYlhOh3YV7tuISA2H91NT2lwR-OpQ2f_fd6S1RjUpssiVf3r7kIe9V_Uot0A5ANYwj4rw_JrRPzRJUb86yd1XRsvzkVWuLPl1EURpRLSu6utsffPAO1_cnFAfKAYCe1',
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



