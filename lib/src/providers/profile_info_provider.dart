import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/profile_model.dart';
import 'package:spotify_api_onur/src/services/profile_info_services.dart';

class ProfileInfoProvider extends ChangeNotifier {
  ProfileInfoModel profileInfo = ProfileInfoModel();
  bool isInfoLoaded = false;

  getInfo() async {
    profileInfo = (await getInfoService())!;
    isInfoLoaded = true;
    notifyListeners();
  }
}
