import 'dart:async';
import 'package:indieflix/database/database.dart';
import 'package:indieflix/model/movie.dart';

class MovieDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Movie records
  Future<int?> createMovie(Movie movie) async {
    final db = await dbProvider.database;
    var result = db?.insert(movieTABLE, movie.toDatabaseJson());
    return result;
  }

  //Get All Movie items
  //Searches if query string was passed
  Future<List<Movie>> getMovies({List<String>? columns, String? query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>>? result;
    if (query != null) {
      if (query.isNotEmpty) {
        result = await db?.query(movieTABLE,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
      }
    } else {
      result = await db?.query(movieTABLE, columns: columns);
    }

    List<Movie>? movies = result!.isNotEmpty
        ? result.map((item) => Movie.fromDatabaseJson(item)).toList()
        : [];
    return movies;
  }

  //Update Movie record
  Future<int?> updateMovie(Movie movie) async {
    final db = await dbProvider.database;

    var result = await db?.update(movieTABLE, movie.toDatabaseJson(),
        where: "id = ?", whereArgs: [movie.id]);

    return result;
  }

  //Delete Movie records
  Future<int?> deleteMovie(int id) async {
    final db = await dbProvider.database;
    var result = await db?.delete(movieTABLE, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllMovies() async {
    final db = await dbProvider.database;
    var result = await db?.delete(
      movieTABLE,
    );

    return result;
  }
}
