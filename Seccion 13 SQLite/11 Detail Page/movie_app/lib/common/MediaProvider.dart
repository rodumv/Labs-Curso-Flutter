import 'dart:async';
import 'package:movie_app/model/Media.dart';
import 'package:movie_app/common/HttpHandler.dart';
import 'package:movie_app/model/Cast.dart';
abstract class MediaProvider{
   Future<List<Media>> fetchMedia(String category);
   Future<List<Cast>> fetchCast(int mediaId);
   
}

class MovieProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
   @override
   Future<List<Media>> fetchMedia(String category){
     return _client.fetchMovies(category: category);
   }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
      return _client.fetchCreditMovies(mediaId);
  }
}

class ShowProvider extends MediaProvider{
   HttpHandler _client = HttpHandler.get();
    @override
   Future<List<Media>> fetchMedia(String category){
     return _client.fetchShow(category: category);
   }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
     return _client.fetchCreditShows(mediaId);
  }
}

enum MediaType {movie, show}