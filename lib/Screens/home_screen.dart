import 'package:flutter/material.dart';
import './nav_screen.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import '../widgets/widgets_directory.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = new ScrollController()
      ..addListener(() {
        setState(() {
          scrollOffset = _scrollController.offset;
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
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppBar(
          scrollOffset: scrollOffset,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(
          Icons.cast,
        ),
        onPressed: () {
          print('cast');
        },
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('Previews'),
                title: "Previews",
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('My List'),
              title: "My List",
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('Orginals'),
              title: "Netflix Orginals",
              contentList: myList,
              isOrginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 8.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: PageStorageKey('Trending'),
                title: "Trending",
                contentList: myList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
