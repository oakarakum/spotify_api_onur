import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/album_tracks_model.dart';

Future<AlbumTracksModel?> getAlbumTracksServices() async {
  AlbumTracksModel data19;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQDFmgzblb9y1sCldTiL01Ye2lnbgtjC-ONalGd-MIodK8AOk4UnCWr5rDmMW_MjV1HVTbA73et20YCpF2jdKZxYbjqNOYIK9bw1DUWx3k5JUXc_4oVDq99unBYcU0u73G5ABzpjKhCvxCPzu9aH7KudMYuRw1HmchHdsbVMkbArmRtHrB38oM2cPzKTUs_85aOSPBEyNLGjNcYfV158dNQqqZUNfmpsPrKtAuIwnVUFjJ_W7c8LPE69g7vYVbCGrmotQd8lMtx9MS_-FTNHZo5ckr1H9BaaWxHjkHdPd278',
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
