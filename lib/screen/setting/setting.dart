import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_videos/bloc/theme/change_them.state.dart';
import 'package:minecraft_videos/bloc/theme/change_theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int option;
  final List<Color> colors = [Colors.white, Color(0xff323639), Colors.black];
  final List<Color> borders = [Colors.black, Colors.white, Colors.white];
  final List<String> themes = ['Light', 'Dark', 'Amoled'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: changeThemeBloc,
      builder: (BuildContext context, ChangeThemeState state) {
        return Theme(
            data: state.themeData,
            child: Container(
              color: state.themeData.primaryColor,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.brightness_4),
                    title: Text(
                      'Theme',
                      style: state.themeData.textTheme.body2,
                    ),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2, color: state.themeData.accentColor),
                          color: state.themeData.primaryColor),
                    ),
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      option = preferences.get('theme_option') ?? 0;
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return BlocBuilder(
                              bloc: changeThemeBloc,
                              builder: (BuildContext context,
                                  ChangeThemeState state) {
                                return AlertDialog(
                                  backgroundColor: state.themeData.primaryColor,
                                  title: Text(
                                    'Change Theme',
                                    style: state.themeData.textTheme.body1,
                                  ),
                                  content: SizedBox(
                                    height: 100,
                                    child: Center(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 3,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Stack(
                                            children: <Widget>[
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              width: 2,
                                                              color: borders[
                                                                  index]),
                                                          color: colors[index]),
                                                    ),
                                                  ),
                                                  Text(themes[index],
                                                      style: state.themeData
                                                          .textTheme.body2)
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          switch (index) {
                                                            case 0:
                                                              changeThemeBloc
                                                                  .onLightThemeChange();
                                                              break;
                                                            case 1:
                                                              changeThemeBloc
                                                                  .onDarkThemeChange();
                                                              break;
                                                            case 2:
                                                              changeThemeBloc
                                                                  .onAmoledThemeChange();
                                                              break;
                                                          }
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 50,
                                                        height: 50,
                                                        child: state.themeData
                                                                    .primaryColor ==
                                                                colors[index]
                                                            ? Icon(Icons.done,
                                                                color: state
                                                                    .themeData
                                                                    .accentColor)
                                                            : Container(),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(themes[index],
                                                      style: state.themeData
                                                          .textTheme.body2)
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(
                      'About',
                      style: state.themeData.textTheme.body2,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return BlocBuilder(
                              bloc: changeThemeBloc,
                              builder: (BuildContext context,
                                  ChangeThemeState state) {
                                return AlertDialog(
                                  backgroundColor: state.themeData.primaryColor,
                                  title: Center(
                                    child: Text(
                                      'Monster Of School',
                                      style: state.themeData.textTheme.body1,
                                    ),
                                  ),
                                  content: SizedBox(
                                    height: 300,
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/logo.png',
                                          height: 150.0,
                                          width: 150.0,
                                        ),
                                        Text(
                                          'Development by:',
                                          textAlign: TextAlign.center,
                                          style:
                                              state.themeData.textTheme.body2,
                                        ),
                                        Text(
                                          'FLUTTER',
                                          textAlign: TextAlign.center,
                                          style:
                                              state.themeData.textTheme.body2,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                        ),
                                        Text(
                                          'FluMoviesPro Studios Dev',
                                          textAlign: TextAlign.center,
                                          style:
                                              state.themeData.textTheme.body2,
                                        ),
                                        SizedBox(
                                          height: 16.0,
                                        ),
                                        Text(
                                          'Version : 1.0',
                                          textAlign: TextAlign.center,
                                          style:
                                              state.themeData.textTheme.body2,
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                          'Copyright © 2019 Minecraft. All rights reserved',
                                          textAlign: TextAlign.center,
                                          style: state
                                              .themeData.textTheme.subtitle,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      );
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
