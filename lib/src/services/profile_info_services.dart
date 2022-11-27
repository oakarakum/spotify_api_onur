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
        'Bearer BQD3IUvN88xt9DLdHyy7Cs-8GeAcBELTLLZIe2OqDlpxiuf6Qzm7dGLiLoKsLAxQlekE8RHlzx6GcQFqi_g-q7F14_6hsILCzL0XNFzW-t5tQXZ4Gbuny-Wk-sQJcQyInz61T2TRLBc4FZzOykUxbMLdcOX2ZhXElHNKhaFbTjtjQEDs6vvTeQJlRpjop6eIcLf6K_3uEo2Q6RH7hHvth-Tc2IrJ9yMlgJETl6W9-IK6fcoJtQvwyhrgc-VkI0-faKSTyAvqZUiju_AluE1DtZRPjOaLPVmqcvdrOg6UeiwX',
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
