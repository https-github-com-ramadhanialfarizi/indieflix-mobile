import 'package:flutter/material.dart';
// import 'package:indieflix/component/carousel.dart';
// import 'package:indieflix/component/flat_card.dart';
// import 'package:indieflix/component/home_activity.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IndieFlix"),
        centerTitle: true,
      ),
      body: ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
        // const Carousel(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Activity", style: Theme.of(context).textTheme.headline4),
              // HomeActivity(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ongoing", style: Theme.of(context).textTheme.headline4),
              const SizedBox(
                height: 10,
              ),
              // const FlatCard(),
              // const FlatCard(),
              // const FlatCard(),
            ],
          ),
        ),
      ]),
    );
  }
}
