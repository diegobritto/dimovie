import 'package:flutter/material.dart';
import 'package:dimovie/bloc/get_movies_bloc.dart';
import 'package:dimovie/model/movie.dart';
import 'package:dimovie/model/movie_response.dart';
import 'package:dimovie/style/theme.dart' as Style;
import 'package:dimovie/widgets/movie_card.dart';

class MoviesList extends StatefulWidget {
  final List<Movie> movies;

  const MoviesList({Key key, this.movies}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState(movies);
}

class _MoviesListState extends State<MoviesList> {
  final List<Movie> movies;

  _MoviesListState(this.movies);

  @override
  Widget build(BuildContext context) {
    if (movies.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Não há filmes...",
                  style: TextStyle(color: Style.Colors.titleColor),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        height: 270.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieCard(
              movie: movies[index],
            );
          },
        ),
      );
  }
}
