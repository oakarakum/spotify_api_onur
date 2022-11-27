import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/profile_publiclist.dart';

import '../providers/profile_publiclist_provider.dart';

Future<PublicPlayListModel?> getPublicListServices() async {
  PublicPlayListModel? data6;
  ProfilePublicListProvider? profilePublicListProvider;
  
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQDDJm36SNdvn0mJp3hXeVyQERvx4KJ9V7YXJBm39Bm6hq7CPCb0WSgKpjpSxzSz31bY1UlhnB1OeCPa1UZo_gfNyEl9-SC-v9OJbOlQaqRbxkmiTxpLl42ievBoHeG68rhbXJmdfmL0Umzb6lMfEJ_6NzMMwUij4gjZEAGsmYJf8cUQ8Yo2fsrFQWXODvSXuxNxzHWzmqm1DYfbGYbW8bgF5pFbqUwgqt9H88fUxY0YT_OKGy8yTpC4lnASrv2pfLqUfIjiSr1L_UoWh1OfwCW3OuugwU9DAZoaCddR',
  };

  var params = {
    'market': 'TR',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/playlists/37i9dQZF1DX9ASuQophyb3?$query');
  var res = await http.get(url, headers: headers);
  
  if (res.statusCode == 200) {
    
    data6 = PublicPlayListModel.fromJson(jsonDecode(res.body));
    return data6;
  } else {
    print("Public Playlist");
    return null;
  }



}
