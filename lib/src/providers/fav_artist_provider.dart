import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/services/get_artist_services.dart';

import '../models/fav_artist_model.dart';
import '../services/fav_artist_services.dart';

class FavArtistProvider extends ChangeNotifier {
  FavArtistModel? favArtistname = FavArtistModel();
  bool isFavArtistLoaded = false;

  getFavArtist() async {
    favArtistname = (await getFavArtistServices())!;
    isFavArtistLoaded = true;
    notifyListeners();
  }
}
