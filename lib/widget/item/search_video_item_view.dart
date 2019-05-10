import 'package:flutter/material.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:minecraft_videos/screen/detail/detail_video.dart';

Widget buildSearchList(
    BuildContext context, List<VidModel> video, String query) {
  try {
    if (query == '') {
      return Container(
        color: Theme.of(context).primaryColor,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.search,
                size: 50,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              'Enter a title to search.',
              style: TextStyle(color: Theme.of(context).accentColor),
            )
          ],
        )),
      );
    } else {
      if (video.length == 0) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.sentiment_dissatisfied,
                  size: 50,
                  color: Theme.of(context).accentColor,
                ),
              ),
              Text(
                'No results found',
                style: TextStyle(color: Theme.of(context).accentColor),
              )
            ],
          )),
        );
      } else {
        return Container(
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            itemCount: video.length,
            itemBuilder: (context, index) {
              var sv = video[index];
              print('Status data : $sv');
              return _buildVideoList(context, sv);
            },
          ),
        );
      }
    }
  } catch (e) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

Widget _buildVideoList(BuildContext context, VidModel cv) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => DetailPlayerVideo(cv))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getImageThumbnail(cv),
          _getColumnText(context, cv),
        ],
      ),
    ),
  );
}

Widget _getImageThumbnail(VidModel cv) {
  return Container(
    child: Stack(
      children: <Widget>[
        _getImageVideo(cv),
        _getTimeDuration(cv),
      ],
    ),
  );
}

Widget _getImageVideo(VidModel cv) {
  return Container(
    width: 200.0,
    height: 110.0,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: FadeInImage(
        image:
            NetworkImage("https://img.youtube.com/vi/" + cv.videoId + "/0.jpg"),
        fit: BoxFit.cover,
        placeholder: AssetImage('assets/images/loading.gif'),
      ),
    ),
  );
}

Widget _getTimeDuration(VidModel cv) {
  return Positioned(
    right: 10.0,
    bottom: 10.0,
    child: Container(
      height: 25.0,
      width: 40.0,
      color: Colors.black,
      child: Center(
          child: Text(cv.videoDuration,
              style: TextStyle(fontSize: 14.0, color: Colors.white))),
    ),
  );
}

Widget _getColumnText(BuildContext context, VidModel cv) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(cv.videoTitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.body2),
        ],
      ),
    ),
  );
}
