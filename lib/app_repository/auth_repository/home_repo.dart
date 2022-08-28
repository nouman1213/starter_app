import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_app/app_model/user_register.dart';
import 'package:starter_app/utils/shared_prefs.dart';

import '../../app_model/movies_model.dart';
import '../../data/network/BaseApiServices.dart';
import '../../data/network/NetworkApiService.dart';
import '../../utils/app_urls.dart';

class HomeRepo {
    BaseApiServices _apiServices = NetworkApiService() ;

  Future<MovieListModel> fetchMoviesList()async{

    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);

    }catch(e){
      throw e ;
    }
  }
}
