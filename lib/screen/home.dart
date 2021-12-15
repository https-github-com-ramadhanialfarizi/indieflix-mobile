import 'package:flutter/material.dart';
import 'package:indieflix/component/card_image.dart';
// import 'package:indieflix/component/carousel.dart';
// import 'package:indieflix/component/flat_card.dart';
// import 'package:indieflix/component/home_activity.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'A',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C',
    'B',
    'C'
  ];
  final List<int> colorCodes = <int>[
    600,
    500,
    100,
    500,
    100,
    500,
    100,
    500,
    100,
    500,
    600,
    500,
    100,
    500,
    100,
    500,
    100,
    500,
    100,
    500,
    100
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Indie Flix"),
          centerTitle: true,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return const CardImage();
              // return Container(
              //   height: 50,
              //   color: Colors.amber[colorCodes[index]],
              //   child: Center(child: Text('Entry ${entries[index]}')),
              // );
            }));
  }
}
