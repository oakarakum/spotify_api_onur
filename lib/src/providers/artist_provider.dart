import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/artist_model.dart';
import 'package:spotify_api_onur/src/services/get_artist_services.dart';

class ArtistProvider extends ChangeNotifier {
  ArtistModel artistList = ArtistModel();
  bool isArtistLoaded = false;

  getArtist() async {
    artistList = (await getArtistServices())!;
    isArtistLoaded = true;
    notifyListeners();
  }
}
