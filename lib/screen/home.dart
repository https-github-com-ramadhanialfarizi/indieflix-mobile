import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indieflix/component/card_image.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
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
  List<int> data = [1, 2, 3, 4];

  // int _focusedIndex = 0;
  void _onItemFocus(int index) {
    setState(() {
      // _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return const CardImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indie Flix"),
        centerTitle: true,
      ),
      body: ScrollSnapList(
        onItemFocus: _onItemFocus,
        // itemSize: 100,
        focusOnItemTap: true,
        itemSize: 216,
        itemBuilder: _buildListItem,
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        dynamicItemSize: true,
        initialIndex: 1,
        // dynamicItemOpacity: 0.5,
        dynamicSizeEquation: (distance) => 1 - min(distance.abs() / 500, 0.1),
      ),
    );
  }
}
