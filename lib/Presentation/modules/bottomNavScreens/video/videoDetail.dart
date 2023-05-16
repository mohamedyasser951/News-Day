import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetails extends StatefulWidget {
  String title;
  String description;
  String mediaUrl;
  VideoDetails(this.title, this.mediaUrl, this.description, {super.key});

  @override
  State<VideoDetails> createState() => _VideoDetailsState(title, mediaUrl);
}

class _VideoDetailsState extends State<VideoDetails> {
  String title;
  String mediaUrl;
  YoutubePlayerController? youtubePlayerController;
  _VideoDetailsState(this.title, this.mediaUrl);

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(mediaUrl);
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          enableCaption: true,
        ));
    super.initState();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFullscreen = false;
    return SafeArea(
      child: Scaffold(body: youtubeHierarchy(isFullscreen)),
    );
  }

  youtubeHierarchy(bool isFullScrenn) {
    return Container(
      child: Align(
        // alignment: Alignment.topCenter,
        child: YoutubePlayerBuilder(
          onEnterFullScreen: () {
            isFullScrenn = true;
          },
          onExitFullScreen: () {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

            isFullScrenn = false;
          },
          player: YoutubePlayer(
            controller: youtubePlayerController!,
          ),
          builder: (p0, p1) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
                p1,
                SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    widget.description,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 15),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
