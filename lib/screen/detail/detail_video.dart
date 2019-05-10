import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_videos/bloc/theme/change_them.state.dart';
import 'package:minecraft_videos/bloc/theme/change_theme_bloc.dart';
import 'package:minecraft_videos/model/video_model.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class DetailPlayerVideo extends StatefulWidget {
  final VidModel vd;
  const DetailPlayerVideo(this.vd);
  @override
  _DetailPlayerVideoState createState() => _DetailPlayerVideoState();
}

class _DetailPlayerVideoState extends State<DetailPlayerVideo> {
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
                  _getYoutubeLayout(),
                  _getTitleVideos(state),
                  _getButtonRow(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getYoutubeLayout() {
    final kWidht = MediaQuery.of(context).size.width;
    return Container(
      height: 200.0,
      width: kWidht,
      child: YoutubePlayer(
        context: context,
        source: widget.vd.videoId,
        quality: YoutubeQuality.HD,
        width: kWidht,
        aspectRatio: 16 / 9,
        autoPlay: false,
        showThumbnail: true,
      ),
    );
  }

  Widget _getTitleVideos(ChangeThemeState state) {
    return Container(
      child: Padding(
        padding:
            EdgeInsets.only(top: 16.0, bottom: 16.0, left: 8.0, right: 8.0),
        child: Text(widget.vd.videoTitle,
            textAlign: TextAlign.center,
            style: state.themeData.textTheme.body2),
      ),
    );
  }

  Widget _getButtonRow() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _onPressButton(
                'https://viral-market.com/135-tm_large_default/facebook-fans.jpg',
                _launchURL),
            _onPressButton(
                'http://icons.iconarchive.com/icons/graphicloads/rounded-social-media/512/share-icon.png',
                _shareNotice),
            _onPressButton(
                'http://icons.iconarchive.com/icons/custom-icon-design/pretty-social-media-2/256/Favorite-icon.png',
                _shareNotice),
          ],
        ),
      ),
    );
  }
}

_onPressButton(String url, VoidCallback onTapp) {
  return GestureDetector(
    onTap: () async {
      onTapp();
    },
    child: Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      child: CircleAvatar(
        maxRadius: 25.0,
        backgroundImage: NetworkImage(url),
      ),
    ),
  );
}

_launchURL() async {
  const url = 'https://fb.com/KidsToysMe/';
  if (Platform.isAndroid) {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      print('Could not launch $url');
    }
  }
}

_shareNotice() async {
  await Share.share("_title:\n_link");
}
