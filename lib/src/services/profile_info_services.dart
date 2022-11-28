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
        'Bearer BQBQCQyBwddtZCKwCngz4LBEegZnwmVJ1UYWMm_DVpFmqnQFrJ2qgapNc6A8MZEMYYjbdt0l0ehcV3mTsXfpbiyosb7oTeRumOhGAlPHs5C-rzdkQHKgKpwNW9gkWRULGsWkaS1rjT62Nf96UPs5P1qlv77j8UnFdv8Lz842QRXJwjTqJVdVqxjqgu0C_sUO-K-RHXwzWK8jV_g-f8i9L0gl4BbykIDLUjZoJAifqog2bpN3LUOiTiQZttYf3yj8GrqxdARUOlDHNST7dajuUq5Vercp0tgYQYUx9ho4HZPm',
  };

  var url = Uri.parse('https://api.spotify.com/v1/me');
  var res = await http.get(url, headers: headers);
  if (res.statusCode == 200) {
    //print(res.body);
    data2 = ProfileInfoModel.fromJson(jsonDecode(res.body));
    return data2;
  } else {
    //print("Başarısız");
    return null;
  }
}
