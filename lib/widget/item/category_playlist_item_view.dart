import 'package:flutter/material.dart';
import 'package:minecraft_videos/api/api_url.dart';
import 'package:minecraft_videos/model/category_model.dart';
import 'package:minecraft_videos/screen/category/video_by_category.dart';

Widget buildcategoryPlaylist(BuildContext context, List<CatVideos> cv) {
  var _width = MediaQuery.of(context).size.width / 2;
  return Container(
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Categories',
                      style: Theme.of(context).textTheme.body1),
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: cv.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                var cat = cv[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => VideosByCategory(cat)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        _getImageCategory(_width, cat),
                        _getTitleCategory(context, cat),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ));
}

Widget _getImageCategory(double _width, CatVideos cat) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Container(
      width: _width,
      height: _width - 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: FadeInImage(
          image: NetworkImage(getImgCategory + cat.categoryImage),
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/images/loading.gif'),
        ),
      ),
    ),
  );
}

Widget _getTitleCategory(BuildContext context, CatVideos cat) {
  return Text(cat.categoryName,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.body2);
}
