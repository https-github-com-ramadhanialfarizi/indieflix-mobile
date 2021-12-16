import 'package:indieflix/dao/movie_dao.dart';
import 'package:indieflix/model/movie.dart';

class MovieRepository {
  final movieDao = MovieDao();

  Future getAllMovies({String? query}) => movieDao.getMovies(query: query);

  Future insertMovie(Movie movie) => movieDao.createMovie(movie);

  Future updateMovie(Movie movie) => movieDao.updateMovie(movie);

  Future deleteMovieById(int id) => movieDao.deleteMovie(id);

  //We are not going to use this in the demo
  Future deleteAllMovies() => movieDao.deleteAllMovies();
}
