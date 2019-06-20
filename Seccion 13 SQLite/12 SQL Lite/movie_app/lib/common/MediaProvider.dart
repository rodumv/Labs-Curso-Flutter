import 'dart:async';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/resources/api_provider.dart';
import 'package:movie_app/model/Cast.dart';
import 'package:movie_app/resources/repository.dart';
abstract class MediaProvider{
   Repository _repository = Repository.get();
   Future<List<Media>> fetchMedia(String category);
   Future<List<Cast>> fetchCast(int mediaId);
   
}

class MovieProvider extends MediaProvider{
  ApiProvider _client = ApiProvider.get();
   @override
   Future<List<Media>> fetchMedia(String category){
     return _client.fetchMovies(category: category);
   }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
      return _repository.fetchCastMovies(mediaId);
  }
}

class ShowProvider extends MediaProvider{
   ApiProvider _client = ApiProvider.get();
    @override
   Future<List<Media>> fetchMedia(String category){
     return _client.fetchShow(category: category);
   }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
     return _repository.fetchCastShows(mediaId);
  }
}

enum MediaType {movie, show}