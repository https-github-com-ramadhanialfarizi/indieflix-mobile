import 'package:flutter/material.dart';

class CardReview extends StatelessWidget {
  const CardReview(
      {Key? key,
      this.id = "",
      this.movieTitle = "",
      this.moviePoster = "",
      this.isVoted = false,
      this.isReviewed = false,
      this.review = ""})
      : super(key: key);

  final String id;
  final String movieTitle;
  final String moviePoster;
  final bool isVoted;
  final bool isReviewed;
  final String review;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/movie_detail'),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
              title: const Text('Tilik'),
              subtitle: Text((() {
                if (isVoted && isReviewed) {
                  return 'You voted and reviewed this movie\n"$review"';
                } else if (isVoted) {
                  return 'You voted this movie';
                } else if (isReviewed) {
                  return 'You reviewed this movie\n"$review"';
                } else {
                  return 'You have not voted and reviewed this movie';
                }
              })()),
              isThreeLine: true,
              trailing: Container(
                  padding: const EdgeInsets.all(4),
                  child: Image.network(moviePoster))),
        ),
      ),
    );
  }
}
