import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/categories_model.dart';

import '../services/get_categories_service.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoriesModel categoriesList = CategoriesModel();
  bool isCategoriesLoaded = false;

  getCategories() async {
    categoriesList = await getCategoriesService();
    isCategoriesLoaded = true;
   // print(categoriesList.categories!.items![5].name);
    notifyListeners();
  }
}
