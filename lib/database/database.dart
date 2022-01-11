import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const movieTABLE = 'Movie';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(documentsDirectory.path, "ReactiveTodo.db");
    var database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $movieTABLE ("
        "id INTEGER PRIMARY KEY, "
        "title TEXT, "
        "synopsis TEXT, "
        "info TEXT, "
        "streamURL TEXT, "
        "posterURL TEXT"
        /*SQLITE doesn't have boolean type
        so we store isDone as integer where 0 is false
        and 1 is true*/
        ")");
  }
}


    // {
    //   'id': 'nd829grb2364798db389',
    //   'title': "Solo, Solitude",
    //   'synopsis':
    //       'Melarikan diri ke Pontianak pada 27 Juli 1996, akhirnya ia dinyatakan hilang pada tahun 1998 bersama 12 aktivis lainnya. Hingga kini Wiji Thukul dinyatakan hilang tanpa diketahui keberadaannya.',
    //   'info': 'Film Terbaik di Jogja - NETPAC Asian Film Festival.',
    //   'streamURL': 'https://i.imgur.com/3Qmaql6.mp4',
    //   'verticalPosterURL':
    //       'https://cdn0-production-images-kly.akamaized.net/IyBduLOf_eOV-1ZzK1Y0X3kiA-s=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768163/original/055693400_1554264123-2.jpg',
    //   'posterURL':
    //       'https://cdn0-production-images-kly.akamaized.net/IyBduLOf_eOV-1ZzK1Y0X3kiA-s=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768163/original/055693400_1554264123-2.jpg'
    // },