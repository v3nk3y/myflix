import 'package:flutter/material.dart';
import 'package:myflix/widgets/all_widgets.dart';

class FeaturedPlayButton extends StatelessWidget {
  const FeaturedPlayButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: !Responsive.isDesktop(context)
          ? const EdgeInsets.fromLTRB(25.0, 0, 30.0, 0)
          : const EdgeInsets.fromLTRB(25.0, 10, 30.0, 10),
      onPressed: () => print('play'),
      color: Colors.white,
      icon: const Icon(Icons.play_arrow, size: 30.0),
      label: const Text(
        'Play',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
