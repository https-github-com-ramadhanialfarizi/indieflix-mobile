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
  late String profilePictureURL =
      'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=240';
  late String profileUserName = 'Gabriella Patricia';

  List<Map<String, dynamic>> data = [
    {
      'id': 'nd829grb2364798db389',
      'movieTitle': '9',
      'isVoted': true,
      'isReviewed': false,
      'review': 'Bagus banget filmnyaa',
      'posterURL':
          'https://akcdn.detik.net.id/visual/2020/08/20/tilik-1_169.png?w=650'
    },
    {
      'id': 'nd829grb2364798db389',
      'movieTitle': "Tabula Rasa",
      'isVoted': true,
      'isReviewed': true,
      'review': 'Bagus banget filmnyaa',
      'posterURL':
          'https://cdn0-production-images-kly.akamaized.net/4cJvF5Lfm9Nw6V1-HVw-kYIkZm4=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768177/original/056775600_1554264865-7.jpg'
    },
    {
      'id': 'nd829grb2364798db389',
      'movieTitle': "27 Steps of May",
      'isVoted': false,
      'isReviewed': true,
      'review': 'Bagus banget filmnyaa',
      'posterURL':
          'https://mmc.tirto.id/image/otf/880x495/2019/04/18/27-steps-of-may--imdb_ratio-16x9.jpg'
    },
    {
      'id': 'nd829grb2364798db389',
      'movieTitle': '',
      'isVoted': true,
      'isReviewed': false,
      'review': 'Bagus banget filmnyaa',
      'posterURL':
          'https://akcdn.detik.net.id/visual/2020/08/20/tilik-1_169.png?w=650'
    },
    {
      'id': 'nd829grb2364798db389',
      'movieTitle': "Ziarah",
      'isVoted': true,
      'isReviewed': true,
      'review': 'Bagus banget filmnyaa',
      'posterURL':
          'https://cdn1-production-images-kly.akamaized.net/nyF0GXjp85MP9Iq7YbeZOogo-bc=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768162/original/039696700_1554263970-ziarah.jpg'
    },
    {
      'id': 'nd829grb2364798db389',
      'movieTitle': "Solo, Solitude",
      'isVoted': false,
      'isReviewed': true,
      'review': 'Bagus banget filmnyaa',
      'posterURL':
          'https://cdn0-production-images-kly.akamaized.net/IyBduLOf_eOV-1ZzK1Y0X3kiA-s=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768163/original/055693400_1554264123-2.jpg'
    },
  ];

  // int _focusedIndex = 0;
  void _onItemFocus(int index) {
    setState(() {
      // _focusedIndex = index;
    });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return CardReview(
      id: data[index]['id'],
      movieTitle: data[index]['movieTitle'],
      moviePoster: data[index]['posterURL'],
      isVoted: data[index]['isVoted'],
      isReviewed: data[index]['isReviewed'],
      review: data[index]['review'],
    );
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
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(profilePictureURL)),
                  const SizedBox(height: 8.0),
                  Text(profileUserName),
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
