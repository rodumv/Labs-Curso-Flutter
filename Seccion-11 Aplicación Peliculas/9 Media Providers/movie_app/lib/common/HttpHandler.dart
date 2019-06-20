import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/common/Constants.dart';
import 'package:movie_app/model/Media.dart';

class HttpHandler{
    static final _httpHandler = new HttpHandler();
    final String _baseUrl = "api.themoviedb.org";
    final String _language = "es-ES";

    static HttpHandler get(){
      return _httpHandler;
    }
    Future<dynamic> getJson(Uri uri) async{
      http.Response response = await http.get(uri);
      return json.decode(response.body);
    }

    Future<List<Media>> fetchMovies(){
      var uri = new Uri.https(_baseUrl, "3/movie/popular",{
         'api_key' : API_KEY, 
         'page' : "1",
         'language' : _language
      });

      return getJson(uri).then(((data) => 
        data['results'].map<Media>((item) =>new Media(item, MediaType.movie)).toList()
      ));
    }

    Future<List<Media>> fetchShow(){
      var uri = new Uri.https(_baseUrl, "3/tv/popular",{
         'api_key' : API_KEY, 
         'page' : "1",
         'language' : _language
      });
    
      return getJson(uri).then(((data) => 
        data['results'].map<Media>((item) =>new Media(item, MediaType.show)).toList()
      ));
    }
}