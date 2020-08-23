import 'package:flutter/material.dart';

class FeaturedVerticalButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const FeaturedVerticalButton({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 5.0),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
