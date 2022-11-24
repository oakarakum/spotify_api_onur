// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/profile_model.dart';
import 'package:spotify_api_onur/src/providers/profile_info_provider.dart';
import 'dart:convert';

Future<ProfileInfoModel> getInfoService() async {
  ProfileInfoModel? data2;

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer BQAbs5TMRfUnN8_vQDmUpC-Kpg5g9MHhByx6bUJvaqCugs1wiey5ITFVX9DR3VZYMNHAVZ-b0BJud_qj4yAOSuXHhLGbdd51tqikO6v3blXU2ngwEHjzIKt2Z_rM69h9Qr-w0nBfw8AQw9NmbRuQ6G2WIN9GEQ4ZG5Q5ujOgfLOmjemDAYeCLWg9UXid3G-8rcl-gFkVpzgsnpYR2hZlXnRTLlWrAI_gA9iM5EYtHcX-th0aaaLGHTiw8trXgk8QRbaeRlvVoIMPvENtzGqmCHr-4HaxCuk',
  };
  var url = Uri.parse(
      'https://api.spotify.com/v1/users/31bos75hv7v4vy4mi5qrv4mwvnsy');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) {
    print(res.body);
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  }
  return data2 = ProfileInfoModel.fromJson(jsonDecode(res.body));
}
