import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_videos/bloc/theme/change_them.state.dart';
import 'package:minecraft_videos/bloc/theme/change_theme_bloc.dart';
import 'package:minecraft_videos/screen/category/category.dart';
import 'package:minecraft_videos/screen/favorite/favorite.dart';
import 'package:minecraft_videos/screen/search/search_videos.dart';
import 'package:minecraft_videos/screen/setting/setting.dart';
import 'package:minecraft_videos/screen/videos/new_videos.dart';
import 'package:minecraft_videos/widget/expandingnav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;
  PageController pageController = PageController();
  List<String> wallpapers = ['Batman', 'Minimal', 'Apple'];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Text(
                      'Monster School',
                      style: state.themeData.textTheme.headline,
                    )
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon:
                        Icon(Icons.search, color: state.themeData.accentColor),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SearchVideos()
                    )),
                  )
                ],
                backgroundColor: state.themeData.primaryColor),
            body: Container(
              color: state.themeData.primaryColor,
              child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: onPageChanged,
                  children: <Widget>[
                    LatestVideos(),
                    Category(),
                    FavoriteVideos(),
                    SettingPage(),
                  ]),
            ),
            bottomNavigationBar: ExpandingBottomBar(
              backgroundColor: state.themeData.primaryColor,
              navBarHeight: 60.0,
              items: [
                ExpandingBottomBarItem(
                  icon: Icons.home,
                  text: "New",
                  selectedColor: state.themeData.accentColor,
                ),
                ExpandingBottomBarItem(
                  icon: Icons.category,
                  text: "Categories",
                  selectedColor: state.themeData.accentColor,
                ),
                ExpandingBottomBarItem(
                  icon: Icons.favorite,
                  text: "Favorites",
                  selectedColor: state.themeData.accentColor,
                ),
                ExpandingBottomBarItem(
                  icon: Icons.settings,
                  text: "Settings",
                  selectedColor: state.themeData.accentColor,
                ),
              ],
              selectedIndex: pageIndex,
              onIndexChanged: navigationTapped,
            ),
          ),
        );
      },
    );
  }

  void onPageChanged(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  void navigationTapped(int value) {
    pageController.animateToPage(value,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}

class SettingsPage {}
