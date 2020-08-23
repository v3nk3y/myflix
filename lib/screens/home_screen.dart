import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myflix/data/data.dart';
import 'package:myflix/widgets/all_widgets.dart';
import 'package:myflix/models/all_models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        child: const Icon(Icons.cast),
        onPressed: () => print('Cast'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: FeaturedContentHeader(
              featuredContent: sintelContent,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Previews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                  height: 160.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        final Content previewContent = previews[index];
                        return GestureDetector(
                          onTap: () => print(previewContent.name),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 130.0,
                                width: 130.0,
                                margin: EdgeInsets.symmetric(horizontal: 16.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(previewContent.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4.0,
                                    color: previewContent.color,
                                  ),
                                ),
                              ),
                              Container(
                                height: 130.0,
                                width: 130.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black,
                                        Colors.black45,
                                        Colors.transparent
                                      ],
                                      stops: [
                                        0,
                                        0.25,
                                        1
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4.0,
                                    color: previewContent.color,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: SizedBox(
                                  height: 60.0,
                                  child:
                                      Image.asset(previewContent.titleImageUrl),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
