import 'package:cinemapedia/domain/entitites/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMaper {
  static Movie movieDBToEntity(MovieMovieDb movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: (movieDb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
      : 'https://cdn.shopify.com/s/files/1/1993/5539/products/noposters_1200x1200.jpg?v=1603727888',
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: (movieDb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
      : 'no-poster',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount
    );
}
