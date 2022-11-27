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
        'Bearer BQAq3PmP0VHcwbJKjPqQixxXaSCvMAtJULFmvRTLdTWJfoL0da_gtGi-_6pJMfa6OU-1m4QrtttP6d_eZcCQ4VMv7KUtlL7vR8upaK9shNa3Xy_zCZo8mt717ZwzmA3HGjBPbM3QcotqVXw8ZTnU9l8Otp_r8Y4tU4auq9CUzqyQDhsYOzVdUs2VyuZl1XsXto3XuM33E28rVDh8EH3dkO6yv2lj7eVq3FzrpxUZQOOd8-ydYp0IpOb4ek8rG49ZiySfaxxtKyaC-Bkq1slmWuOo75qwERg',
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
