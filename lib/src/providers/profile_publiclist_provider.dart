import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/artist_model.dart';
import 'package:spotify_api_onur/src/models/profile_publiclist.dart';
import 'package:spotify_api_onur/src/services/public_playlist_services.dart';

class ProfilePublicListProvider extends ChangeNotifier {
PublicPlayListModel publicPlayList = PublicPlayListModel();
  bool isArtistLoaded = false;

  getPublicList() async {
    publicPlayList = (await getPublicListServices())!;
    isArtistLoaded = true;
    notifyListeners();
  }
}