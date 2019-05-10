import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_videos/bloc/theme/change_them.state.dart';
import 'package:minecraft_videos/bloc/theme/change_theme_bloc.dart';
import 'package:minecraft_videos/bloc/video_by_category_bloc.dart';
import 'package:minecraft_videos/model/category_model.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:minecraft_videos/screen/search/search_videos.dart';
import 'package:minecraft_videos/widget/item/video_by_category_item_view.dart';

class VideosByCategory extends StatefulWidget {
  final CatVideos category;
  VideosByCategory(this.category);
  @override
  _VideosByCategoryState createState() => _VideosByCategoryState();
}

class _VideosByCategoryState extends State<VideosByCategory> {
  @override
  void initState() {
    videoByCategoryBloc.getVideoByCategory(widget.category.cid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: changeThemeBloc,
      builder: (BuildContext context, ChangeThemeState state) {
        return Theme(
          data: state.themeData,
          child: Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  elevation: 5,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: Image.asset('assets/images/logo.png'),
                      // ),
                      Text(
                        widget.category.categoryName,
                        style: state.themeData.textTheme.headline,
                      )
                    ],
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: state.themeData.accentColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.search,
                            color: state.themeData.accentColor),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchVideos()))),
                  ],
                  backgroundColor: state.themeData.primaryColor),
              body: Container(
                color: state.themeData.primaryColor,
                child: StreamBuilder(
                  stream: videoByCategoryBloc.getVideoByCategoryList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<VidModel>> snapshot) {
                    var categoryVideo = snapshot.data;
                    if (snapshot.hasData) {
                      return buildCategoryVideo(context, categoryVideo);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              )),
        );
      },
    );
  }
}
