import 'package:flutter/material.dart';
import 'package:myflix/models/all_models.dart';
import 'package:myflix/widgets/all_widgets.dart';
import 'package:video_player/video_player.dart';

class FeaturedContentHeader extends StatelessWidget {
  final Content featuredContent;
  const FeaturedContentHeader({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _FeaturedContentHeaderMobile(featuredContent: featuredContent),
      desktop: _FeaturedContentHeaderDesktop(featuredContent: featuredContent),
    );
  }
}

class _FeaturedContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _FeaturedContentHeaderMobile({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 100.0,
          child: SizedBox(
            child: Image.asset(featuredContent.titleImageUrl),
            width: 250.0,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FeaturedVerticalButton(
                icon: Icons.add,
                title: 'My List',
                onTap: () => print('My List'),
              ),
              FeaturedPlayButton(),
              FeaturedVerticalButton(
                icon: Icons.info_outline,
                title: 'Info',
                onTap: () => print('Info'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _FeaturedContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _FeaturedContentHeaderDesktop({
    Key key,
    @required this.featuredContent,
  }) : super(key: key);

  @override
  __FeaturedContentHeaderDesktopState createState() =>
      __FeaturedContentHeaderDesktopState();
}

class __FeaturedContentHeaderDesktopState
    extends State<_FeaturedContentHeaderDesktop> {
  VideoPlayerController _videoController;
  bool isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.network(widget.featuredContent.videoUrl)
          ..initialize().then((_) => setState(() {}))
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.initialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: _videoController.value.initialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          AspectRatio(
            aspectRatio: _videoController.value.initialized
                ? _videoController.value.aspectRatio
                : 2.344,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(widget.featuredContent.titleImageUrl),
                ),
                const SizedBox(height: 15.0),
                Text(
                  widget.featuredContent.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    FeaturedPlayButton(),
                    const SizedBox(width: 20.0),
                    FlatButton.icon(
                      padding: const EdgeInsets.fromLTRB(25.0, 10, 30.0, 10),
                      onPressed: () => print('More Info'),
                      icon: const Icon(
                        Icons.info_outline,
                        size: 30.0,
                      ),
                      color: Colors.white,
                      label: const Text(
                        'More Info',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    if (_videoController.value.initialized)
                      IconButton(
                        icon:
                            Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: () => setState(() {
                          isMuted
                              ? _videoController.setVolume(100)
                              : _videoController.setVolume(0);
                          isMuted = _videoController.value.volume == 0;
                        }),
                      )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
