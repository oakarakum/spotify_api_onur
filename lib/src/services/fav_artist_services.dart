import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/fav_artist_model.dart';

Future<FavArtistModel?> getFavArtistServices() async {
  FavArtistModel? data13;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQB57huvt3fOKaBQrJivPOnDcyBbRF4mPmLaCAmryrJLNj3Edwdy62SViSUDEiVDLGKtYG2nfCJoYZQFLLjc7lAvSCMpcfNMWSBCr8Z3bIlfvtbezHeqpVs5y73meL2Zhrye_Syv9-53vEY6wvj9CxcnBlF8uxGCPWVT7Afdijs7jOnE6TYD_7MCMYKISMoW31fX4c3_gxbG-PDNQae9G4USoPzJKvps9wr2MfL8xJbpYihXgaXbJI34FDYQImJdleq69Uqv17bA6ebtwfZhzO5l3MUPp8hAktduZmp_T4fP',
  };

  var params = {
    'type': 'artist',
    'limit': '20',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/me/following?$query');
  var res = await http.get(url, headers: headers);

  return data13 = FavArtistModel.fromJson(jsonDecode(res.body));
}
