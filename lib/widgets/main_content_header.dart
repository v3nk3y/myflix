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
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}
