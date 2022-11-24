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
        'Bearer BQCC60hBYTXZqT6wVTy-a9sVOZ7QO4WNhByXNApArIAAmV5VjRmKl2d_Tpc4dvwP7l_cwVfreV6PZrBEepHBsmtQYu_uMCOQj56p96njukL1oUIE8GA0cFF3sxUz7W2HY9gPzRact5fC4Sh3cWR9-GByFaovGQBbcWnWjInEFNXiYRsOkyV4NfzWJkuIdj5v-1ejDFPR0NJHHpuSUy_ltBCjR8auykwIH4V15XS7jfG14lB2D0RJOgsRFNh5_0ukmexOpz7jhaJo0iNLnxegbky9faGhqWF32Abo0VJuWNFa',
  };
  var url = Uri.parse(
      'https://api.spotify.com/v1/users/31bos75hv7v4vy4mi5qrv4mwvnsy');
  var res = await http.get(url, headers: headers);
  if (res.statusCode == 200) {
    print(res.body);
    data2 = ProfileInfoModel.fromJson(jsonDecode(res.body));
    return data2;
  } else {
    print("Başarısız");
    return null;
  }
}
