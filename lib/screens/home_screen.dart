import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dimovie/style/theme.dart' as Style;
import 'package:dimovie/widgets/best_movies.dart';
import 'package:dimovie/widgets/genres.dart';
import 'package:dimovie/widgets/now_playing.dart';
import 'package:dimovie/widgets/persons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          BestMovies(),
          GenresTab(),
          PersonsList(),
        ],
      ),
    );
  }
}
