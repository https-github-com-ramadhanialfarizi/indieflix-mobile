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
  // List<int> data = [1, 2, 3, 4];

  // int _focusedIndex = 0;
  void _onItemFocus(int index) {
    setState(() {
      // _focusedIndex = index;
    });
  }

  List<Map<String, dynamic>> data = [
    {
      'id': 'nd829grb2364798db389',
      'vote_count': 9,
      'cast':
          'Siti Fauziah, Brilliana Desy, Angeline Rizky, Dyah Mulani, Lully Syahkisrani',
      'title': "Tilik",
      'synopsis': 'wkwk ini sinposis',
      'info': 'Best Picture • Festival Movie',
      'streamURL': 'https://i.imgur.com/3Qmaql6.mp4',
      'verticalPosterURL':
          'https://akcdn.detik.net.id/visual/2020/08/20/tilik-1_169.png?w=650',
      'posterURL':
          'https://akcdn.detik.net.id/visual/2020/08/20/tilik-1_169.png?w=650'
    },
    {
      'id': 'nd829grb2364798db389',
      'vote_count': 9,
      'cast': '',
      'title': "Tabula Rasa",
      'synopsis':
          'Seorang pemuda dari Serui, Papua, yang memiliki impian menjadi seorang pemain bola profesional. Namun, ternyata takdir membawanya pada nasib yang tidak beruntung, ia malah menjadi luntang lantung di pinggir kota besar. Gagal menjadi pemain sepak bola, Hans pun menemukan bakat lain di bidang kuliner.',
      'info': 'Kuliner',
      'streamURL': 'https://i.imgur.com/3Qmaql6.mp4',
      'verticalPosterURL':
          'https://cdn0-production-images-kly.akamaized.net/4cJvF5Lfm9Nw6V1-HVw-kYIkZm4=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768177/original/056775600_1554264865-7.jpg',
      'posterURL':
          'https://cdn0-production-images-kly.akamaized.net/4cJvF5Lfm9Nw6V1-HVw-kYIkZm4=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768177/original/056775600_1554264865-7.jpg'
    },
    {
      'id': 'nd829grb2364798db389',
      'vote_count': 9,
      'cast': '',
      'title': "27 Steps of May",
      'synopsis':
          'Perjalanan Mbah Sri mencari makam asli mendiang suaminya, Prawiro, yang meninggal saat perang. Selama ini, Mbah Sri tahunya makam suaminya adalah sebuah gundukan tanah yang di atasnya ada bambu runcing dan bendera.',
      'info': 'Best Screenplay • Festival Movie',
      'streamURL': 'https://i.imgur.com/3Qmaql6.mp4',
      'verticalPosterURL':
          'https://mmc.tirto.id/image/otf/880x495/2019/04/18/27-steps-of-may--imdb_ratio-16x9.jpg',
      'posterURL':
          'https://mmc.tirto.id/image/otf/880x495/2019/04/18/27-steps-of-may--imdb_ratio-16x9.jpg'
    },
    {
      'id': 'nd829grb2364798db389',
      'vote_count': 9,
      'cast': '',
      'title': "Ziarah",
      'synopsis':
          'Perjalanan Mbah Sri mencari makam asli mendiang suaminya, Prawiro, yang meninggal saat perang. Selama ini, Mbah Sri tahunya makam suaminya adalah sebuah gundukan tanah yang di atasnya ada bambu runcing dan bendera.',
      'info': 'AIFFA',
      'streamURL': 'https://i.imgur.com/3Qmaql6.mp4',
      'verticalPosterURL':
          'https://cdn1-production-images-kly.akamaized.net/nyF0GXjp85MP9Iq7YbeZOogo-bc=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768162/original/039696700_1554263970-ziarah.jpg',
      'posterURL':
          'https://cdn1-production-images-kly.akamaized.net/nyF0GXjp85MP9Iq7YbeZOogo-bc=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768162/original/039696700_1554263970-ziarah.jpg'
    },
    {
      'id': 'nd829grb2364798db389',
      'vote_count': 9,
      'cast': '',
      'title': "Solo, Solitude",
      'synopsis':
          'Melarikan diri ke Pontianak pada 27 Juli 1996, akhirnya ia dinyatakan hilang pada tahun 1998 bersama 12 aktivis lainnya. Hingga kini Wiji Thukul dinyatakan hilang tanpa diketahui keberadaannya.',
      'info': 'Film Terbaik di Jogja - NETPAC Asian Film Festival.',
      'streamURL': 'https://i.imgur.com/3Qmaql6.mp4',
      'verticalPosterURL':
          'https://cdn0-production-images-kly.akamaized.net/IyBduLOf_eOV-1ZzK1Y0X3kiA-s=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768163/original/055693400_1554264123-2.jpg',
      'posterURL':
          'https://cdn0-production-images-kly.akamaized.net/IyBduLOf_eOV-1ZzK1Y0X3kiA-s=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2768163/original/055693400_1554264123-2.jpg'
    },
  ];
  Widget _buildListItem(BuildContext context, int index) {
    return CardImage(
      title: data[index]['title'],
      posterURL: data[index]['posterURL'],
      info: data[index]['info'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/image/logo-crop.png",
          height: 25,
        ),
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
