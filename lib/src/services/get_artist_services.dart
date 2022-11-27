import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spotify_api_onur/src/models/artist_model.dart';
import 'package:spotify_api_onur/src/providers/artist_provider.dart';

Future<ArtistModel?> getArtistServices() async {
  ArtistModel? data3;
  ArtistProvider? artistProvider;

 var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQC783rBklwSGuhmAfS0Wnw6E4wzwnnWhnTB2izkxgw4fk1C_HaxGQt52_qcgECpOs95Ni1vqxAzR1AYZNVtWOQ-p5k4y93MENoYbSrlezbp_5WUb9_MpyLRw4_KQkPbY9WrSm-1DBzhnaI_pmV62kfPvUlENdUC0xRupsodu4NDXvMhIlQOVdZOQt_3uEqXRek',
  };

  var params = {
    'type': 'artist',
    'limit': '10',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/me/following?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode == 200) {
    //print(res.body);
    data3 = ArtistModel.fromJson(jsonDecode(res.body));
    return data3;
  } else {
    //print("Action Failed");
    return null;
  }
}

 
