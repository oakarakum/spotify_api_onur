import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/profile_model.dart';

class ProfileInfoProvider extends ChangeNotifier {
  ProfileInfoModel profileInfo = ProfileInfoModel();
  bool isInfoLoaded = false;

  getInfo() async {
    profileInfo = await getInfo();
    isInfoLoaded = true;
    notifyListeners();
  }
}
