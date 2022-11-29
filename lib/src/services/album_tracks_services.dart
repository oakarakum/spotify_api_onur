import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/album_tracks_model.dart';

Future<AlbumTracksModel?> getAlbumTracksServices() async {
  AlbumTracksModel data19;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQB57huvt3fOKaBQrJivPOnDcyBbRF4mPmLaCAmryrJLNj3Edwdy62SViSUDEiVDLGKtYG2nfCJoYZQFLLjc7lAvSCMpcfNMWSBCr8Z3bIlfvtbezHeqpVs5y73meL2Zhrye_Syv9-53vEY6wvj9CxcnBlF8uxGCPWVT7Afdijs7jOnE6TYD_7MCMYKISMoW31fX4c3_gxbG-PDNQae9G4USoPzJKvps9wr2MfL8xJbpYihXgaXbJI34FDYQImJdleq69Uqv17bA6ebtwfZhzO5l3MUPp8hAktduZmp_T4fP',
  };

  var params = {
    'market': 'TR',
    'limit': '15',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse(
      'https://api.spotify.com/v1/albums/5iDHYiybU2wC5xhRjjCVEX/tracks?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode == 200) {
    print(res.body);
    data19 = AlbumTracksModel.fromJson(jsonDecode(res.body));
    return data19;
  } else {
    //print("Action Failed");
    return null;
  }
}
