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
    'Authorization': 'Bearer BQBEAuxoKD1NdVvQOaaM6T6R8KLdZTm_8afJqkZz3ubsl5eBK0VrbHZeszb9RMMOxkAePQ259lbkwbZpied-fAsxtbJml5DqJHmekiRfoIN7BKaZRaWdDoemGZlQe4L5IlHzvlmMii8Ak12ILKkrRED6wtzmILqOrFbR66j5ogUu-MTPXAR74W5aCL_sT7I8sHU8_a_rrjfASL8QWQew3KQ7YJsKT_QvrcUgKo8vWtlP_t39stgUojiKFGYskGDiD_cq0OV-m3928DCXROn1WJq6w0LwQ3efznL3Mk1vv9y4',
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

 
