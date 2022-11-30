import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/fav_artist_model.dart';

Future<FavArtistModel?> getFavArtistServices() async {
  FavArtistModel? data13;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQDFmgzblb9y1sCldTiL01Ye2lnbgtjC-ONalGd-MIodK8AOk4UnCWr5rDmMW_MjV1HVTbA73et20YCpF2jdKZxYbjqNOYIK9bw1DUWx3k5JUXc_4oVDq99unBYcU0u73G5ABzpjKhCvxCPzu9aH7KudMYuRw1HmchHdsbVMkbArmRtHrB38oM2cPzKTUs_85aOSPBEyNLGjNcYfV158dNQqqZUNfmpsPrKtAuIwnVUFjJ_W7c8LPE69g7vYVbCGrmotQd8lMtx9MS_-FTNHZo5ckr1H9BaaWxHjkHdPd278',
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
