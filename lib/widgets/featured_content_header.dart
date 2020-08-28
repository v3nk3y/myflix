import 'package:flutter/material.dart';
import 'package:myflix/models/all_models.dart';
import 'package:myflix/widgets/all_widgets.dart';

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

class _FeaturedContentHeaderDesktop extends StatelessWidget {
  final Content featuredContent;

  const _FeaturedContentHeaderDesktop({
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
