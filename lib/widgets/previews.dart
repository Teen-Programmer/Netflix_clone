import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  Previews({this.title, this.contentList});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 26),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          height: 160,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];

              return GestureDetector(
                onTap: () {
                  print(content.name);
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(content.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color, width: 4.0),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
