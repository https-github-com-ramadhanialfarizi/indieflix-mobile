import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  final String movieTitle = "Last Night in Soho";
  final String posterURL =
      "https://cdn1-production-images-kly.akamaized.net/2Hve9XXm28RgTXfVDw5STfv9fLk=/640x853/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3621647/original/030818200_1635929268-last_night_in_soho.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                          "Last Night in Soho",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.merge(const TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "action • thriller • mystery",
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
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent)),
                                onPressed: () => Navigator.pushNamed(
                                    context, 'movie_player'),
                                icon: const Icon(Icons.play_circle_outline),
                                label: const Text('Vote')),
                            const SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.transparent)),
                                onPressed: () => Navigator.pushNamed(
                                    context, 'movie_player'),
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
                const Text(
                    "An aspiring fashion designer is mysteriously able to enter the 1960s, where she encounters a dazzling wannabe singer. However, the glamour is not all it appears to be, and the dreams of the past start to crack and splinter into something far darker."),
                const SizedBox(
                  height: 16,
                ),
                Text("Pemain", style: Theme.of(context).textTheme.headline5),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                    "Thomasin McKenzie, Anya Taylor-Joy, Matt Smith, Rita Tushingham, Terence Stamp, Diana Rigg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
