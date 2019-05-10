import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_videos/bloc/search_video_bloc.dart';
import 'package:minecraft_videos/bloc/theme/change_them.state.dart';
import 'package:minecraft_videos/bloc/theme/change_theme_bloc.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:minecraft_videos/widget/item/search_video_item_view.dart';

class SearchVideos extends StatefulWidget {
  @override
  _SearchVideosState createState() => _SearchVideosState();
}

class _SearchVideosState extends State<SearchVideos> {
  TextEditingController editingController = TextEditingController();
  String query = '';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     empty = editingController.text;
  //   });
  // }
  @override
  void dispose() {
    searchVideoBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return BlocBuilder(
      bloc: changeThemeBloc,
      builder: (BuildContext context, ChangeThemeState state) {
        return Theme(
          data: state.themeData,
          child: Scaffold(
            body: Container(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: Column(
                children: <Widget>[
                  _getAppBarSearch(),
                  _getResultVideos(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getAppBarSearch() {
    return Container(
      height: 50.0,
      child: Card(
        elevation: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {});
              },
              icon: Icon(Icons.arrow_back),
            ),
            Expanded(
                child: TextField(
                
              maxLines: 1,
              style: Theme.of(context).textTheme.body2,
              decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.body2,
                  hintText: "Search video here...",
                  border: InputBorder.none),
              onSubmitted: (query) {
                setState(() {
                  searchVideoBloc.getSearchVideo(query);
                });
              },
              controller: editingController,
            )),
            IconButton(
              onPressed: () {
                setState(() async {
                  editingController.text = await query;
                });
              },
              icon: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }

  Widget _getResultVideos() {
    return Expanded(
      child: Container(
          child: StreamBuilder(
        stream: searchVideoBloc.searchVideoList,
        builder:
            (BuildContext context, AsyncSnapshot<List<VidModel>> snapshot) {
          var sv = snapshot.data;
          print('status snapshot : $sv');
          return buildSearchList(
              context, sv, editingController.text.toString());
        },
      )),
    );
  }
}
