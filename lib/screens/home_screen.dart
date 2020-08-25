import 'package:flutter/material.dart';
import 'package:myflix/data/data.dart';
import 'package:myflix/widgets/all_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffset = 0.0;
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: FeaturedContentHeader(
              featuredContent: sintelContent,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            sliver: SliverToBoxAdapter(
              child: PreviewsSection(
                key: PageStorageKey('previews'),
                title: 'Previews',
                previewsContentList: previews,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 10.0),
            sliver: SliverToBoxAdapter(
              child: ContentSection(
                key: PageStorageKey('myList'),
                title: 'My List',
                contentSectionList: myList,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 10.0),
            sliver: SliverToBoxAdapter(
              child: ContentSection(
                key: PageStorageKey('myflixOriginals'),
                title: 'Myflix Originals',
                contentSectionList: originals,
                isOriginals: true,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentSection(
                key: PageStorageKey('trending'),
                title: 'Trending',
                contentSectionList: trending,
              ),
            ),
          )
        ],
      ),
    );
  }
}
