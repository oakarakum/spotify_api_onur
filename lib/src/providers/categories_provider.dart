import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/models/categories_model.dart';

import '../services/get_categories_service.dart';

class CategoriesProvider extends ChangeNotifier {
  CategoriesModel? categories_list;
  bool isCategoriesLoaded = false;

  getCategories() async {
    categories_list = await getCategoriesService();
    isCategoriesLoaded = true;
    print(categories_list!.categories!.items![5].name);
  }
}
