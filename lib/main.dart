import 'package:flutter/material.dart';
import 'package:minecraft_videos/screen/home/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monster School',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
