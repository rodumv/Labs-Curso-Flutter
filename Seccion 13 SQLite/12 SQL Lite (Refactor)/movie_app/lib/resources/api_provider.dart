import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/common/Constants.dart';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/common/MediaProvider.dart';
import 'package:movie_app/model/Cast.dart';
import 'package:movie_app/resources/resource_provider.dart';

class ApiProvider implements ResourceProvider{
    static final _apiProvider = new ApiProvider();
    final String _baseUrl = "api.themoviedb.org";
    final String _language = "es-ES";

    static ApiProvider get(){
      return _apiProvider;
    }
    Future<dynamic> getJson(Uri uri) async{
      http.Response response = await http.get(uri);
      return json.decode(response.body);
    }

    Future<List<Media>> fetchMovies({String category : "populares"}) async{
      var uri = new Uri.https(_baseUrl, "3/movie/$category",{
         'api_key' : API_KEY, 
         'page' : "1",
         'language' : _language
      });

      return getJson(uri).then(((data) => 
        data['results'].map<Media>((item) =>new Media(item, MediaType.movie)).toList()
      ));
    }

    Future<List<Media>> fetchShow({String category : "populares"})async{
      var uri = new Uri.https(_baseUrl, "3/tv/$category",{
         'api_key' : API_KEY, 
         'page' : "1",
         'language' : _language
      });
    
      return getJson(uri).then(((data) => 
        data['results'].map<Media>((item) =>new Media(item, MediaType.show)).toList()
      ));
    }

   Future<List<Cast>> fetchCasts(int mediaId,  MediaType mediaType)async{
      print('${mediaId.toString()} Lectura de tmdb para movies');
      final String endpoint = (mediaType == MediaType.movie ? "movie" : "tv");
      var uri = new Uri.https(_baseUrl, "3/$endpoint/$mediaId/credits",{
         'api_key' : API_KEY, 
         'page' : "1",
         'language' : _language
      });
    
      return getJson(uri).then(((data) => 
        data['cast'].map<Cast>((item) =>new Cast(item, MediaType.movie, mediaId)).toList()
      ));
    }
}
final ApiProvider apiProvider = new ApiProvider();