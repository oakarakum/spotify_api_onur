import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/fav_mix_model.dart';
import 'package:spotify_api_onur/src/services/fav_mixes_services.dart';

class FavouriteMixesProvider extends ChangeNotifier {
  FavMixModel favMixesList = FavMixModel();
  bool isFavMixLoaded = false;

  getFavMixes() async {
    favMixesList = (await getFavMixesServices())!;
    isFavMixLoaded = true;
    notifyListeners();
  }
}
