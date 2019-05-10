import 'package:flutter/material.dart';
import 'package:minecraft_videos/bloc/category_bloc.dart';
import 'package:minecraft_videos/model/category_model.dart';
import 'package:minecraft_videos/widget/item/category_playlist_item_view.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  void initState() {
    categoryBloc.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: categoryBloc.getCategoryList,
        builder:
            (BuildContext context, AsyncSnapshot<List<CatVideos>> snapshot) {
          var category = snapshot.data;
          if (snapshot.hasData) {
            return buildcategoryPlaylist(context, category);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
