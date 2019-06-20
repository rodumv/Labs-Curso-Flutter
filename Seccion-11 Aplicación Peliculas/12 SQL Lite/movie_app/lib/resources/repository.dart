import 'package:movie_app/resources/api_provider.dart';
import 'package:movie_app/resources/db_provider.dart';
import 'package:movie_app/model/Cast.dart';
class Repository{
  static final Repository _repository = new Repository();
  ApiProvider _apiProvider = ApiProvider.get();
  DBProvider _dbProvider = DBProvider.get();

  static Repository get(){
    return _repository;
  }

  Future<List<Cast>> fetchCastMovies(int mediaId) async{
    List<Cast> list = await _dbProvider.fetchCasts(mediaId);
    if(list != null){
      return list;
    }
    list = await _apiProvider.fetchCreditMovies(mediaId);
    list.forEach((element) => _dbProvider.addCast(element));
    return list;
  }

  Future<List<Cast>> fetchCastShows(int mediaId) async{
    List<Cast> list = await _dbProvider.fetchCasts(mediaId);
    if(list != null){
      return list;
    }
    list = await _apiProvider.fetchCreditShows(mediaId);
    list.forEach((element) => _dbProvider.addCast(element));
    return list;
  }


}