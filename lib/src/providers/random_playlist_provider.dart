import 'package:flutter/foundation.dart';
import 'package:spotify_api_onur/src/models/random_playlist_model.dart';

import '../services/random_playlist_service.dart';

class RandomPlayListProvider with ChangeNotifier {
  RandomPlayListModel randomPlayList = RandomPlayListModel();
  bool isRandomPlaylistLoaded = false;

  getRandomPlayList() async {
    randomPlayList = (await getRandomPlayListServices())!;
    bool isRandomPlaylistLoaded = true;
    notifyListeners();
  }
}


