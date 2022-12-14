import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/ui/pages/search_screen.dart';
import 'package:spotify_api_onur/src/providers/album_tracks_provider.dart';
import 'package:spotify_api_onur/src/providers/artist_provider.dart';
import 'package:spotify_api_onur/src/providers/bot_navbar_provider.dart';
import 'package:spotify_api_onur/src/providers/categories_provider.dart';
import 'package:spotify_api_onur/src/providers/fav_artist_album_provider.dart';
import 'package:spotify_api_onur/src/providers/fav_artist_provider.dart';
import 'package:spotify_api_onur/src/providers/fav_mixes_provider.dart';
import 'package:spotify_api_onur/src/providers/profile_info_provider.dart';
import 'package:spotify_api_onur/src/providers/profile_playlist_provider.dart';
import 'package:spotify_api_onur/src/providers/random_playlist_provider.dart';
import 'package:spotify_api_onur/src/providers/search_list_providers.dart';
import 'package:spotify_api_onur/src/ui/pages/homepage_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => SearchListProvider())),
      ChangeNotifierProvider(create: ((context) => AlbumTracksProvider())),
      ChangeNotifierProvider(create: ((context) => FavArtAlbumProvider())),
      ChangeNotifierProvider(create: ((context) => FavArtistProvider())),
      ChangeNotifierProvider(create: ((context) => BottomNavigationProvider())),
      ChangeNotifierProvider(create: ((context) => ProfilePlaylistProvider())),
      ChangeNotifierProvider(create: ((context) => RandomPlayListProvider())),
      ChangeNotifierProvider(create: ((context) => FavouriteMixesProvider())),
      ChangeNotifierProvider(
        create: (context) => CategoriesProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProfileInfoProvider(),
      ),
      ChangeNotifierProvider(create: ((context) => ArtistProvider()))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primarySwatch: Colors.blue,
            ),
            home: HomePageScreen());
      },
    );
  }
}
