import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/fav_artist_album_model.dart';
import 'package:spotify_api_onur/src/services/fav_artist_album_services.dart';

class FavArtAlbumProvider extends ChangeNotifier {
  FavArtAlbumModel favArtAlbumlist = FavArtAlbumModel();
  bool isFavArtAlbumLoaded = false;

  getFavArtAlbum() async {
    favArtAlbumlist = (await getFavArtAlbumServices())!;
    isFavArtAlbumLoaded = true;
    notifyListeners();
  }
}
