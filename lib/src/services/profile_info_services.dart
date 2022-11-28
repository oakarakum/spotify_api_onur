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
        'Bearer BQABZNXGEu-AS4iLJn83ccQU2uoabyJQ0nqbGJSoA29DpCU3Os6X0N0-GoWeVLhAIto7lsGQEiSgSSNyrRtCoRzUZB59AsTznPVBiSrtA3v0siGLeRAbbnJiray-vUQ-B07Ml7si5zUbNzYvN5RvbrT5cRynzLC2yXPOZVUUTsCWixAccEqye4Y6iNnODuaGh78bW7aaPVQs7H0p5Yyol5hprHd8jrYMSEZPe0GWF2RR5R4aATWiXPAcYGEVQqyALhr4q4MvjB4x3rA0dBooLNpGrMMy29u-6mqCa9LMRfvr',
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
