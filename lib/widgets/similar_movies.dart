import 'package:dimovie/widgets/movie_card.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dimovie/bloc/get_movie_similar_bloc.dart';
import 'package:dimovie/model/movie.dart';
import 'package:dimovie/model/movie_response.dart';
import 'package:dimovie/style/theme.dart' as Style;

import 'error_card.dart';
import 'loading_card.dart';
import 'movies_list.dart';

class SimilarMovies extends StatefulWidget {
  final int id;

  SimilarMovies({Key key, @required this.id}) : super(key: key);

  @override
  _SimilarMoviesState createState() => _SimilarMoviesState(id);
}

class _SimilarMoviesState extends State<SimilarMovies> {
  final int id;

  _SimilarMoviesState(this.id);

  @override
  void initState() {
    super.initState();
    similarMoviesBloc.getSimilarMovies(id);
  }

  @override
  void dispose() {
    similarMoviesBloc..drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "FILMES SIMILARES",
            style: TextStyle(
                color: Style.Colors.titleColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<MovieResponse>(
          stream: similarMoviesBloc.subject.stream,
          builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return _buildErrorWidget(snapshot.data.error);
              }
              return _buildHomeWidget(snapshot.data);
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error);
            } else {
              return _buildLoadingWidget();
            }
          },
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return LoadingCard();
  }

  Widget _buildErrorWidget(String error) {
    return  ErrorCard(error: error);
  }

  Widget _buildHomeWidget(MovieResponse data) {
    return MoviesList(movies: data.movies);
  }
}
