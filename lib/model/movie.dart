class Movie {
  int? id;
  //synopsis is the text we see on
  //main screen card text
  String? title;
  String? info;
  String? synopsis;
  String? streamURL;
  String? posterURL;
  //When using curly braces { } we note dart that
  //the parameters are optional
  Movie(
      {this.id,
      this.synopsis,
      this.title,
      this.info,
      this.streamURL,
      this.posterURL});
  factory Movie.fromDatabaseJson(Map<String, dynamic> data) => Movie(
      //This will be used to convert JSON objects that
      //are coming from querying the database and converting
      //it into a Movie object
      id: data['id'],
      title: data['title'],
      info: data['info'],
      synopsis: data['synopsis'],
      streamURL: data['streamURL'],
      posterURL: data['posterURL']
      //Since sqlite doesn't have boolean type for true/false
      //we will 0 to denote that it is false
      //and 1 for true
      );
  Map<String, dynamic> toDatabaseJson() => {
        //This will be used to convert Movie objects that
        //are to be stored into the datbase in a form of JSON
        "id": id,
        "title": title,
        "synopsis": synopsis,
        "info": info,
        "streamURL": streamURL,
        "posterURL": posterURL
      };
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
