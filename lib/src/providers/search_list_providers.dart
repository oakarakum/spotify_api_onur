import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';

import '../services/search_list_services.dart';

class SearchListProvider extends ChangeNotifier {
  SearchModels searchlist = SearchModels();
  String query = "Onur";

  getSearchData() async {
    searchlist = (await getSearchDataService(query))!;
    notifyListeners();
  }

  getQuery(String query2) {
    query = query2;
    getSearchData();
    notifyListeners();
  }
}
