
import 'package:cinemapedia/domain/entitites/movie.dart';

abstract class MovieRepository {

  Future<List<Movie>>getNowPlaying({ int page = 1});

}