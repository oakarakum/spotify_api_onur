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
        'Bearer BQDFmgzblb9y1sCldTiL01Ye2lnbgtjC-ONalGd-MIodK8AOk4UnCWr5rDmMW_MjV1HVTbA73et20YCpF2jdKZxYbjqNOYIK9bw1DUWx3k5JUXc_4oVDq99unBYcU0u73G5ABzpjKhCvxCPzu9aH7KudMYuRw1HmchHdsbVMkbArmRtHrB38oM2cPzKTUs_85aOSPBEyNLGjNcYfV158dNQqqZUNfmpsPrKtAuIwnVUFjJ_W7c8LPE69g7vYVbCGrmotQd8lMtx9MS_-FTNHZo5ckr1H9BaaWxHjkHdPd278',
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
