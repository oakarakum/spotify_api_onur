import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/profile_playlist_model.dart';

Future<ProfilePlaylistModel?> getProfilePlaylistServices() async {
  ProfilePlaylistModel? data11;
 var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQBEAuxoKD1NdVvQOaaM6T6R8KLdZTm_8afJqkZz3ubsl5eBK0VrbHZeszb9RMMOxkAePQ259lbkwbZpied-fAsxtbJml5DqJHmekiRfoIN7BKaZRaWdDoemGZlQe4L5IlHzvlmMii8Ak12ILKkrRED6wtzmILqOrFbR66j5ogUu-MTPXAR74W5aCL_sT7I8sHU8_a_rrjfASL8QWQew3KQ7YJsKT_QvrcUgKo8vWtlP_t39stgUojiKFGYskGDiD_cq0OV-m3928DCXROn1WJq6w0LwQ3efznL3Mk1vv9y4',
  };

  var params = {
    'market': 'TR',
    'limit': '20',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/playlists/37i9dQZF1DXdV4VkZg6NlO/tracks?$query');
  var res = await http.get(url, headers: headers);

  data11 = ProfilePlaylistModel.fromJson(jsonDecode(res.body));
  return data11;
}


/* 
Uzun olan

import 'package:http/http.dart' as http;

void main() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQDIBS_WvU53UrfFqpm3bBjoNsdjEE0cwBpnAn71ojAmT3cclTFbEDkZjpGlVBPuOJW7Q1DCpA5JZmEi5s-mb4LFKFRCvB8cnR6BibSbTL46QvxEh7lu9Kf3BjNyj5QZHznCmgSyib_mZcS18pgu4WUVwOPEl5jq2f0NXYbvU0-4E4WdtxfB2FMHfOnqQL2wunwuZ4BRJkMs4kw-mi1R0TgrJjDGxUyMgk-EuDVHSM2-0jBms2QhYc_QL5W3JPDVJPqN57aypKP_8ommpR2P_3QkTaV2cambF20VVEAqF4Sro0KeLPI2TvVUVpVq_zSAri8zLQ79Qw',
  };

  var params = {
    'market': 'TR',
    'limit': '20',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/playlists/37i9dQZF1DXdV4VkZg6NlO/tracks?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
}

 */