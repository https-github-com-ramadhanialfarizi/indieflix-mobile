import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indieflix/component/sliding_appbar.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatefulWidget {
  const MoviePlayer({Key? key}) : super(key: key);

  @override
  _MoviePlayerState createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<MoviePlayer>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late final AnimationController _appBarController;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://rr2---sn-poqvn5u-jb3d.googlevideo.com/videoplayback?expire=1639510330&ei=2py4YZf1Gpb6yQXLqrmIBQ&ip=188.126.94.182&id=o-AC0zSe0SUR8IfeDluof6tK9jl2T-z78dLSXp-JCCyTAE&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&ns=um9TuYLAOJLvlAr2xHmsksEG&gir=yes&clen=22753570&ratebypass=yes&dur=327.053&lmt=1550162045361138&fexp=24001373,24007246&c=WEB&txp=5531432&n=mmyB12TI79oPkg&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIgVUtZlPGcZD7d9qjFh8E-f769Y7fGDNaGh5_hdtjeSI8CIQDHLmRTiXokzOtn7zQl_vs6eh1LZK_fWA4Z6HY96llbPQ%3D%3D&redirect_counter=1&rm=sn-5golk7l&req_id=c605426313b7a3ee&cms_redirect=yes&ipbypass=yes&mh=bL&mip=120.188.66.95&mm=31&mn=sn-poqvn5u-jb3d&ms=au&mt=1639488548&mv=m&mvi=2&pcm2cms=yes&pl=23&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AG3C_xAwRQIgGD7W3VW9LcZWnd4nEbRXmwAMpaGvI0JoCT6OI-iUFT4CIQC4h1M2HuqvkmJevUTlwSxU1zD-85ieY58xLqf5RD5C_A%3D%3D',
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true));

    _initializeVideoPlayerFuture = _controller.initialize();

    super.initState();

    _appBarController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SlidingAppBar(
        visible: !_controller.value.isPlaying,
        controller: _appBarController,
        child: AppBar(
          title: const Text('Last Night in Soho'),
          systemOverlayStyle: SystemUiOverlayStyle(),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            print(snapshot);
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              // _controller.play();
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
