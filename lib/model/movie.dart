class Movie {
  int? id;
  //synopsis is the text we see on
  //main screen card text
  String? title;
  String? synopsis;
  String? streamURL;
  //isDone used to mark what Movie item is completed
  bool? isDone = false;
  //When using curly braces { } we note dart that
  //the parameters are optional
  Movie(
      {this.id,
      this.synopsis,
      this.title,
      this.streamURL,
      this.isDone = false});
  factory Movie.fromDatabaseJson(Map<String, dynamic> data) => Movie(
        //This will be used to convert JSON objects that
        //are coming from querying the database and converting
        //it into a Movie object
        id: data['id'],
        title: data['title'],
        synopsis: data['synopsis'],
        streamURL: data['streamURL'],
        //Since sqlite doesn't have boolean type for true/false
        //we will 0 to denote that it is false
        //and 1 for true
        isDone: data['is_done'] == 0 ? false : true,
      );
  Map<String, dynamic> toDatabaseJson() => {
        //This will be used to convert Movie objects that
        //are to be stored into the datbase in a form of JSON
        "id": id,
        "title": title,
        "synopsis": synopsis,
        "streamURL": streamURL,
        "is_done": isDone == false ? 0 : 1,
      };
}
