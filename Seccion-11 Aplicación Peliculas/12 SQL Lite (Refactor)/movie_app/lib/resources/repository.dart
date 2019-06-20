import 'package:movie_app/common/MediaProvider.dart';
import 'package:movie_app/resources/api_provider.dart';
import 'package:movie_app/resources/db_provider.dart';
import 'package:movie_app/model/Cast.dart';
import 'package:movie_app/resources/resource_provider.dart';
class Repository{
  static final Repository _repository = new Repository();
  List<ResourceProvider> _providers = <ResourceProvider>[
    dbProvider,
    apiProvider
  ];

  List<CacheProvider> caches = <CacheProvider>[
    dbProvider
  ];

  static Repository get(){
    return _repository;
  }

  Future<List<Cast>> fetchCasts(int mediaId, MediaType mediatype) async{
    var provider;
    List<Cast> list;

    for(provider in _providers){
      list = await provider.fetchCasts(mediaId, mediatype);
      if(list != null){
        break;
      }
    }
    for(var cache in caches){
      if(cache != provider){
        list.forEach((element) => cache.addCast(element));
      }
    }
    return list;
    
  }

}