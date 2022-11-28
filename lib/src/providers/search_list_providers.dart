import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';

import '../services/search_list_services.dart';

class SearchListProvider extends ChangeNotifier {
  SearchModels searchlist = SearchModels();

  getSearchData() async {
    searchlist = (await getSearchDataService())!;
  }
}


/* 
class RandomPlayListProvider with ChangeNotifier {
  RandomPlayListModel randomPlayList = RandomPlayListModel();
  bool isRandomPlaylistLoaded = false;

  getRandomPlayList() async {
    randomPlayList = (await getRandomPlayListServices())!;
    bool isRandomPlaylistLoaded = true;
    notifyListeners();
  }
} */