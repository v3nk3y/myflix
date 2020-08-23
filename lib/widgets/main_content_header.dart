import 'package:flutter/material.dart';
import 'package:myflix/models/all_models.dart';

class MainContentHeader extends StatelessWidget {
  final Content featuredContent;
  const MainContentHeader({
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
      ],
    );
  }
}
