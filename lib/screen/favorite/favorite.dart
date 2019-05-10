import 'package:flutter/material.dart';

class FavoriteVideos extends StatefulWidget {
  @override
  _FavoriteVideosState createState() => _FavoriteVideosState();
}

class _FavoriteVideosState extends State<FavoriteVideos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.search,
            size: 50,
            color: Theme.of(context).accentColor,
          ),
          Text('No favorite video found.',
              style: TextStyle(
                  fontSize: 18.0, color: Theme.of(context).accentColor))
        ],
      )),
    );
  }
}
