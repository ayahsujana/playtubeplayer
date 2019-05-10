import 'package:flutter/material.dart';
import 'package:minecraft_videos/bloc/new_video_bloc.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:minecraft_videos/widget/item/new_video_item_view.dart';

class LatestVideos extends StatefulWidget {
  @override
  _LatestVideosState createState() => _LatestVideosState();
}

class _LatestVideosState extends State<LatestVideos> {
  @override
  void initState() {
    videoListBloc.getNewVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: videoListBloc.getNewVideoList,
        builder:
            (BuildContext context, AsyncSnapshot<List<VidModel>> snapshot) {
          var video = snapshot.data;
          if (snapshot.hasData) {
            return buildNewVideos(context, video);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
