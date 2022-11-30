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
        'Bearer BQDFmgzblb9y1sCldTiL01Ye2lnbgtjC-ONalGd-MIodK8AOk4UnCWr5rDmMW_MjV1HVTbA73et20YCpF2jdKZxYbjqNOYIK9bw1DUWx3k5JUXc_4oVDq99unBYcU0u73G5ABzpjKhCvxCPzu9aH7KudMYuRw1HmchHdsbVMkbArmRtHrB38oM2cPzKTUs_85aOSPBEyNLGjNcYfV158dNQqqZUNfmpsPrKtAuIwnVUFjJ_W7c8LPE69g7vYVbCGrmotQd8lMtx9MS_-FTNHZo5ckr1H9BaaWxHjkHdPd278',
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
