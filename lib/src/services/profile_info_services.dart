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
        'Bearer BQAvCbVCDiIHMYtowa_9jatJmr1bAyo6sBAFGEP5cnWo80XYMyqR_WPPow74HwaGXde3NHUmvXGJHYKC0D4v5JMrFAIuLwoOC7XvbJy7n8PltIjVOaInIsJ5ds5uHV5j7esv3NT9HizVdAr_xRiGWM-EdluZlAxuNNulyclYVrFw_cAiHSpG-Q2xUugiuAv16SIe2EF8gGPXirrukMzqtL9ZiPoBdk2xALu_LoRFyZlW7jjbU0aCY2q5Ult5UZGThlrRajnIZR40IsMmonzVEt-92Z1h-P36b5zRBC_22-SL',
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
