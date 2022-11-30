import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/profile_playlist_model.dart';

import '../services/profile_playlist_service.dart';

class ProfilePlaylistProvider extends ChangeNotifier {
  ProfilePlaylistModel profilePlaylist = ProfilePlaylistModel();
  bool isPlaylistLoaded = false;

  getPlaylist() async {
    profilePlaylist = (await getProfilePlaylistServices())!;
    isPlaylistLoaded = true;
    notifyListeners();
  }
}