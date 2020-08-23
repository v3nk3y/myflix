import 'package:flutter/material.dart';
import 'package:myflix/models/all_models.dart';

class PreviewsSection extends StatelessWidget {
  final String title;
  final List<Content> previewsContentList;
  const PreviewsSection({
    Key key,
    @required this.title,
    @required this.previewsContentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          height: 165.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: previewsContentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content previewContent = previewsContentList[index];
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
                          child: Image.asset(previewContent.titleImageUrl),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
