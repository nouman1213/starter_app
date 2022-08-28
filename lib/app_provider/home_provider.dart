import 'package:flutter/foundation.dart';

import '../app_model/movies_model.dart';
import '../app_repository/auth_repository/home_repo.dart';
import '../data/response/api_response.dart';

class HomeProvider with ChangeNotifier {
  final _homeRepo = HomeRepo();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());

    _homeRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
