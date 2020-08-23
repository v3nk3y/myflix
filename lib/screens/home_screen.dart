import 'package:flutter/material.dart';
import 'package:myflix/data/data.dart';
import 'package:myflix/widgets/all_widgets.dart';

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
            child: PreviewsSection(
              title: 'Previews',
              previewsContentList: previews,
            ),
          ),
        ],
      ),
    );
  }
}
