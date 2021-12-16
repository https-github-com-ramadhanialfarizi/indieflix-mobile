import 'dart:math';

import 'package:flutter/material.dart';
import 'package:indieflix/component/card_review.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<int> data = [1, 2, 3, 4];

  // int _focusedIndex = 0;
  void _onItemFocus(int index) {
    setState(() {
      // _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return const CardReview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            pinned: true,
            snap: true,
            floating: true,
            stretch: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground
              ],
              centerTitle: true,
              title: const Text('Ulasanmu', textAlign: TextAlign.center),
              // background: Image.network(
              //   'https://images.pexels.com/photos/5212345/pexels-photo-5212345.jpeg?auto=compress&cs=tinysrgb&h=240',
              //   fit: BoxFit.cover,
              // ),
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=240')),
                  SizedBox(height: 8.0),
                  Text("Abadi Suryo"),
                ],
              ),
            ),
            // bottom: PreferredSize(
            //   preferredSize: const Size.fromHeight(56.0),
            //   child: Text('hehe'),
            // ),
          ),
          SliverFillRemaining(
            child: ScrollSnapList(
              onItemFocus: _onItemFocus,
              // itemSize: 100,
              focusOnItemTap: true,
              itemSize: 96,
              itemBuilder: _buildListItem,
              itemCount: data.length,
              scrollDirection: Axis.vertical,
              dynamicItemSize: true,
              initialIndex: 1,
              // dynamicItemOpacity: 0.5,
              dynamicSizeEquation: (distance) =>
                  1 - min(distance.abs() / 500, 0.1),
            ),
          )
        ],
      ),
    );
  }
}
