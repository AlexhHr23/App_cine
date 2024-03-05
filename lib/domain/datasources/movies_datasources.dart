
import 'package:cinemapedia/domain/entitites/movie.dart';

abstract class MovieDatasource {

  Future<List<Movie>>getNowPlaying({ int page = 1});

}