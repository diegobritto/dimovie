import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dimovie/model/movie.dart';
import 'package:dimovie/style/theme.dart' as Style;

import 'movies_list.dart';

class MovieGenre extends StatefulWidget {
  final List<Movie> movies;

  MovieGenre({Key key, @required this.movies}) : super(key: key);

  @override
  _MovieGenreState createState() => _MovieGenreState(movies);
}

class _MovieGenreState extends State<MovieGenre> {
  final List<Movie> movies;

  _MovieGenreState(this.movies);

  @override
  Widget build(BuildContext context) {
    return MoviesList(movies: movies);
  }
}
