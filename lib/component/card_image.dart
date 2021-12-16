import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    Key? key,
    this.id = "",
    this.title = "",
    this.synopsis = "",
    this.info = "",
    this.streamURL = "",
    this.posterURL =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQI2zZL1k5VDKb-Sv3Hu586PGDI2l50ZL_YbC0ki3Y_OKsTq__-iiYolz_9khyx-fy1Gk&usqp=CAU",
  }) : super(key: key);

  final String id;
  final String title;
  final String synopsis;
  final String info;
  final String streamURL;
  final String posterURL;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            height: 216,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image(
                    height: double.infinity,
                    image: NetworkImage(posterURL),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.7),
                          ],
                          stops: const [
                            0.0,
                            1.0
                          ])),
                  height: double.infinity,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.merge(const TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(info, style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox.expand(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, 'movie_detail'),
                    ),
                  ),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
      ],
    );
  }
}
