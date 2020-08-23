import 'package:flutter/material.dart';
import 'package:myflix/myflix_assets.dart';
import 'package:myflix/models/all_models.dart';

final Content sintelContent = Content(
  name: 'Sintel',
  imageUrl: MyflixAssets.sintel,
  titleImageUrl: MyflixAssets.sintelTitle,
  videoUrl: MyflixAssets.sintelVideoUrl,
  description:
      'A lonely young woman, Sintel, helps and befriends a dragon,\nwhom she calls Scales. But when he is kidnapped by an adult\ndragon, Sintel decides to embark on a dangerous quest to find\nher lost friend Scales.',
);

final List<Content> previews = const [
  Content(
    name: 'The Umbrella Academy',
    imageUrl: MyflixAssets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: MyflixAssets.umbrellaAcademyTitle,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: MyflixAssets.blackMirror,
    color: Colors.red,
    titleImageUrl: MyflixAssets.blackMirrorTitle,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: MyflixAssets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: MyflixAssets.umbrellaAcademyTitle,
  ),
  Content(
    name: 'Black Mirror',
    imageUrl: MyflixAssets.blackMirror,
    color: Colors.red,
    titleImageUrl: MyflixAssets.blackMirrorTitle,
  ),
  Content(
    name: 'The Umbrella Academy',
    imageUrl: MyflixAssets.umbrellaAcademy,
    color: Colors.yellow,
    titleImageUrl: MyflixAssets.umbrellaAcademyTitle,
  ),
];
