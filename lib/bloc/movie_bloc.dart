import 'package:indieflix/model/movie.dart';
import 'package:indieflix/repository/movie_repository.dart';

import 'dart:async';

class MovieBloc {
  //Get instance of the Repository
  final _movieRepository = MovieRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _movieController = StreamController<List<Movie>>.broadcast();

  get movies => _movieController.stream;

  MovieBloc() {
    getMovies();
  }

  getMovies({String? query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _movieController.sink
        .add(await _movieRepository.getAllMovies(query: query));
  }

  addMovie(Movie movie) async {
    await _movieRepository.insertMovie(movie);
    getMovies();
  }

  updateMovie(Movie movie) async {
    await _movieRepository.updateMovie(movie);
    getMovies();
  }

  deleteMovieById(int id) async {
    _movieRepository.deleteMovieById(id);
    getMovies();
  }

  dispose() {
    _movieController.close();
  }
}
