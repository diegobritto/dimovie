import 'package:flutter/material.dart';
import 'package:dimovie/bloc/get_movies_byGenre_bloc.dart';
import 'package:dimovie/model/movie.dart';
import 'package:dimovie/model/movie_response.dart';
import 'package:dimovie/widgets/movie_card.dart';

import 'error_card.dart';
import 'loading_card.dart';
import 'movies_list.dart';

class GenreMovies extends StatefulWidget {
  final int genreId;

  GenreMovies({Key key, @required this.genreId}) : super(key: key);

  @override
  _GenreMoviesState createState() => _GenreMoviesState(genreId);
}

class _GenreMoviesState extends State<GenreMovies> {
  final int genreId;

  _GenreMoviesState(this.genreId);

  @override
  void initState() {
    super.initState();
    moviesByGenreBloc.getMoviesByGenre(genreId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieResponse>(
      stream: moviesByGenreBloc.subject.stream,
      builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error);
          }
          return _buildHomeWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget();
        }
      },
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
