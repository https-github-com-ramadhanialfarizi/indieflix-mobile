import 'package:flutter/material.dart';

class CardReview extends StatefulWidget {
  const CardReview({Key? key}) : super(key: key);

  @override
  _CardReviewState createState() => _CardReviewState();
}

class _CardReviewState extends State<CardReview> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      child: ListTile(
          title: const Text('Tilik'),
          subtitle: const Text(
              'You voted and reviewed this\n"Really good storyline"'),
          isThreeLine: true,
          trailing: Container(
              padding: const EdgeInsets.all(4),
              child: Image.network(
                  'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=240'))),
    );
  }
}
