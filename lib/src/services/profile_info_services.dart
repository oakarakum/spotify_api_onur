// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/profile_model.dart';
import 'package:spotify_api_onur/src/providers/profile_info_provider.dart';
import 'dart:convert';

Future<ProfileInfoModel?> getInfoService() async {
  ProfileInfoModel? data2;
  ProfileInfoProvider? profileInfoProvider;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQCCWI6DLAF68Dz5vaFzvDX0QnhC45VnHz1gQEYmhB8UMbVNiKKa9n_Oabb5BXlhQ7wa3BqUZcZShxqABzfifYEIo9AA7iEWbETu_oRrsjFKM3Q46mo_yobJwTDBmcY2GIbfDdHMIh2VIV37rFubGTbcUCP3bCtH5JylKDVbaVImzY7E9376qjh3Z9x_RVB2HpHFeGEX-IwNkLee_0e_d3GysdmtoH8Y5iojIj-GJrbfp0ep6eLKCwm7Jb5zElUdj02d4G0__BRNMDy9wP4KSMp0hrryeXCgnJZcR2fDKomfmAE',
  };

  var url = Uri.parse('https://api.spotify.com/v1/me');

  var res = await http.get(url, headers: headers);
  if (res.statusCode == 200) {
    //print(res.body);
    data2 = ProfileInfoModel.fromJson(jsonDecode(res.body));
    return data2;
  } else {
    print("Başarısız");
    return null;
  }
}
