import 'package:flutter/material.dart';
import 'package:myflix/myflix_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      color: Colors.blueAccent,
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(MyflixAssets.netflixLogoV1),
            SizedBox(width: 10.0),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarTextButton(
                    title: 'TV Shows',
                    onTap: () => print('TV Shows'),
                  ),
                  _AppBarTextButton(
                    title: 'Movies',
                    onTap: () => print('Movies'),
                  ),
                  _AppBarTextButton(
                    title: 'My List',
                    onTap: () => print('My List'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarTextButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const _AppBarTextButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
