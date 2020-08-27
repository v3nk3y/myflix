import 'package:flutter/material.dart';
import 'package:myflix/myflix_assets.dart';
import 'package:myflix/widgets/all_widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key key, this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      color:
          Colors.black.withOpacity((scrollOffset / 400).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobileVersion(),
        desktop: _CustomAppBarDesktopVersion(),
      ),
    );
  }
}

class _CustomAppBarMobileVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

class _CustomAppBarDesktopVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(MyflixAssets.netflixLogoV2),
          SizedBox(width: 10.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarTextButton(
                  title: 'Home',
                  onTap: () => print('Home'),
                ),
                _AppBarTextButton(
                  title: 'TV Shows',
                  onTap: () => print('TV Shows'),
                ),
                _AppBarTextButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                _AppBarTextButton(
                  title: 'Latest',
                  onTap: () => print('Latest'),
                ),
                _AppBarTextButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 28.0,
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () => print('Search'),
                ),
                _AppBarTextButton(
                  title: 'KIDS',
                  onTap: () => print('KIDS'),
                ),
                _AppBarTextButton(
                  title: 'DVD',
                  onTap: () => print('DVD'),
                ),
                IconButton(
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28.0,
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () => print('Gift Card'),
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  iconSize: 28.0,
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () => print('Notifications'),
                ),
              ],
            ),
          ),
        ],
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
