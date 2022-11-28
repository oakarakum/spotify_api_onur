import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/album_tracks_model.dart';
import 'package:spotify_api_onur/src/services/album_tracks_services.dart';

class AlbumTracksProvider extends ChangeNotifier {
  AlbumTracksModel albumTracks = AlbumTracksModel();
  bool isAlbumTracksLoaded = false;

  getAlbumTracks() async {
    isAlbumTracksLoaded = false;
    albumTracks = (await getAlbumTracksServices())!;
    isAlbumTracksLoaded = true;
    notifyListeners();
  }
}
