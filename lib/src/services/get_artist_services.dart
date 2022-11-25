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
    'Authorization':
        'Bearer BQA-dXCTn8_PvrvgvJuqDRW5_LJmjWPCvWKKkB3Q9Ha19RfeGKqGxxBWNsS86nIY6Op2i8YJb3ji_INZxxhz9EqN6Aeynct7vr-Uos7KPr7vTQExwL2IylctVvy7j1NcrfnyRGPSnxrDY0nfgMPnxh7m2ZMYWYc9pMrGs9ASk6z_V1FIBjqO2-sLu5A0BNg4HqyCrTI2W7GufaBEevW7Z-M2f-fkL3nvaJmMaF939nqqWSxPMjGrmvdehwrZqfmSEr8SjJAJyIyQyzeU0-u1Xboh-OFYUgrhpMntLGo6gfezzfs',
  };

  var params = {
    'ids':
        '2CIMQHirSU0MQqyYHq0eOx,57dN52uHvrHOxijzpIgu3E,1vCWHaC5f2uS3yhpwWbIA6',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/artists?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode == 200) {
    //print(res.body);
    data3 = ArtistModel.fromJson(jsonDecode(res.body));
    return data3;
  } else {
    print("Action Failed");
    return null;
  }
}

/* 
import 'package:http/http.dart' as http;

void main() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQDCMc2tPcZ60ZlgUNoeemv3MhGteWxx_KtU5WbrqpS2bEuWfFGZgLGlx1dTOq9iVb00nSudSHz34zaeTPJTyX3HYRoo86Rmh6t-JthtTmILAmYfw4L_v2-CNU0rQpgdrc6OEaNIO5YGZ9ubvfVBjq_mY9p1tR76GEE7REeHPDrbx0ach-zZ75VeyAkF89pGnFGr9x-_cdo64F1tqeRxO2VByBaPQZTaVVHcDTt18gi2gMcnCQE20yNHxoZVmoO-sL6hIhMfOsKi26rKVVNYLS6XxUuY5yZghWzMq7tyJ9qn',
  };

  var params = {
    'ids': '2CIMQHirSU0MQqyYHq0eOx,57dN52uHvrHOxijzpIgu3E,1vCWHaC5f2uS3yhpwWbIA6',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/artists?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  print(res.body);
}

 */