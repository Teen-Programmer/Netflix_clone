import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets_directory.dart';
import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;

  const CustomAppBar({Key key, this.scrollOffset = 0.0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        desktop: CustomAppBarDesktop(),
        mobile: CustomAppBarMobile(),
      ),
    );
  }
}

class CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Image.asset(Assets.netflixLogo1),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _AppBarButton(
                  title: 'Home',
                  ontap: () => print('Home'),
                ),
                _AppBarButton(
                  title: 'TV Shows',
                  ontap: () => print('TV Shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  ontap: () => print('Movies'),
                ),
                _AppBarButton(
                  title: 'My List',
                  ontap: () => print('My List'),
                ),
                _AppBarButton(
                  title: 'Latest',
                  ontap: () => print('Movies'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                  color: Colors.white,
                  icon: Icon(Icons.search),
                  onPressed: () => print("Search"),
                ),
                _AppBarButton(
                  title: 'KIDS',
                  ontap: () => print('KIDS'),
                ),
                _AppBarButton(
                  title: 'DVD',
                  ontap: () => print('DVD'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                  color: Colors.white,
                  icon: Icon(Icons.card_giftcard),
                  onPressed: () => print("Giftcard"),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28,
                  color: Colors.white,
                  icon: Icon(Icons.notifications),
                  onPressed: () => print("Notifications"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Image.asset(Assets.netflixLogo0),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _AppBarButton(
                  title: 'TV Shows',
                  ontap: () => print('TV Shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  ontap: () => print('Movies'),
                ),
                _AppBarButton(
                  title: 'My List',
                  ontap: () => print('My List'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function ontap;

  const _AppBarButton({Key key, this.title, this.ontap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
