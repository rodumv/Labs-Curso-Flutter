import 'package:movie_app/common/MediaProvider.dart';
import 'package:movie_app/model/Cast.dart';
abstract class ResourceProvider{
  Future<List<Cast>> fetchCasts(int mediaId, MediaType mediaType);
}

abstract class CacheProvider{
  void addCast(Cast cast);
}