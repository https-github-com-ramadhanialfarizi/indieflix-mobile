import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  // final String movieTitle = "Last Night in Soho";
  // final String posterURL =
  //     "https://cdn1-production-images-kly.akamaized.net/2Hve9XXm28RgTXfVDw5STfv9fLk=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3621647/original/030818200_1635929268-last_night_in_soho.jpg";

  Map<String, dynamic> data = {
    'id': 'nd829grb2364798db389',
    'title': "Tilik",
    'cast':
        'Siti Fauziah, Brilliana Desy, Angeline Rizky, Dyah Mulani, Lully Syahkisrani',
    'synopsis':
        'Sebuah rombongan ibu-ibu dari suatu desa yang berangkat menggunakan truk ke kota guna menjenguk ibu lurah yang sakit. Mereka terpaksa menggunakan kendaraan ini karena bus yang biasanya digunakan tidak bisa dipesan dadakan. Dari sinilah semua cerita dan dialog jahil dimulai.',
    'info': 'Best Picture • Festival Movie',
    'streamURL': 'https://i.imgur.com/3Qmaql6.mp4',
    'verticalPosterURL':
        'https://cdn1-production-images-kly.akamaized.net/EytQObj54-wn-1RbC8G-Nx5Nv2M=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3216143/original/086739100_1598152094-Poster_film_Tilik.jpeg',
    'posterURL':
        'https://akcdn.detik.net.id/visual/2020/08/20/tilik-1_169.png?w=650'
  };

  bool _isVoted = false;
  void _votePressed() {
    setState(() {
      _isVoted = !_isVoted;
    });
    // print(_isVoted);
  }

  final TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ulasan'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: "Ketik ulasanmu di sini"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  late String codeDialog;
  late String valueText;

  @override
  Widget build(BuildContext context) {
    final String movieTitle = data['title'];
    final String posterURL = data['verticalPosterURL'];
    final String info = data['info'];
    final String synopsis = data['synopsis'];
    final String cast = data['cast'];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.0),
                  Colors.black.withOpacity(0.9),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                stops: const [0.0, 0.9],
                tileMode: TileMode.clamp),
          ),
        ),
        elevation: 0,
        title: Text(movieTitle),
      ),
      body: ListView(
        children: [
          SizedBox(
              height: 600,
              child: Stack(
                children: [
                  Image(
                    width: double.infinity,
                    height: double.infinity,
                    image: NetworkImage(posterURL),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.0),
                              const Color(0xFF2c3332),
                            ],
                            stops: const [
                              0.0,
                              1.0
                            ])),
                    width: double.infinity,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          movieTitle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.merge(const TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          info,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.red[700])),
                                onPressed: () => Navigator.pushNamed(
                                    context, 'movie_player'),
                                icon: const Icon(Icons.play_circle_outline),
                                label: const Text('Putar')),
                            const SizedBox(
                              width: 16,
                            ),
                            ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.grey[900])),
                                onPressed: _votePressed,
                                icon: _isVoted
                                    ? const Icon(Icons.thumb_up)
                                    : const Icon(Icons.thumb_up_outlined),
                                label: _isVoted
                                    ? const Text('Disukai')
                                    : const Text('Suka')),
                            const SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color?>(
                                            Colors.grey[900])),
                                onPressed: () async {
                                  return _displayTextInputDialog(context);
                                },
                                child: const Text('Beri Ulasan')),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sinopsis", style: Theme.of(context).textTheme.headline5),
                const SizedBox(
                  height: 8,
                ),
                Text(synopsis),
                const SizedBox(
                  height: 16,
                ),
                Text("Pemain", style: Theme.of(context).textTheme.headline5),
                const SizedBox(
                  height: 8,
                ),
                Text(cast),
              ],
            ),
          )
        ],
      ),
    );
  }
}
