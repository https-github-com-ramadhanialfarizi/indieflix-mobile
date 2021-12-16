class Movie {
  int? id;
  //description is the text we see on
  //main screen card text
  String? description;
  //isDone used to mark what Movie item is completed
  bool? isDone = false;
  //When using curly braces { } we note dart that
  //the parameters are optional
  Movie({this.id, this.description, this.isDone = false});
  factory Movie.fromDatabaseJson(Map<String, dynamic> data) => Movie(
        //This will be used to convert JSON objects that
        //are coming from querying the database and converting
        //it into a Movie object
        id: data['id'],
        description: data['description'],
        //Since sqlite doesn't have boolean type for true/false
        //we will 0 to denote that it is false
        //and 1 for true
        isDone: data['is_done'] == 0 ? false : true,
      );
  Map<String, dynamic> toDatabaseJson() => {
        //This will be used to convert Movie objects that
        //are to be stored into the datbase in a form of JSON
        "id": id,
        "description": description,
        "is_done": isDone == false ? 0 : 1,
      };
}
