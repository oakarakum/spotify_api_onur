import 'package:flutter/cupertino.dart';
import 'package:spotify_api_onur/src/ui/pages/browse_screen.dart';
import 'package:spotify_api_onur/src/ui/pages/homepage_screen.dart';
import 'package:spotify_api_onur/src/ui/pages/profile_page_screen.dart';

class BottomNavigationProvider with ChangeNotifier {
  int index = 0;
  
  PageSwitcher(int indext){
    index = indext;
    notifyListeners();
  }

  PageTransition(){
    switch (index) {
      case  0 :
      return HomePageScreen();
      case  1 :
      return BrowseScreen();
      case  2 :
      return HomePageScreen();
      case  3 :
      return ProfilePage();
        
      default:
    }
  }
  
}