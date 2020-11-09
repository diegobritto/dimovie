import 'package:flutter/material.dart';
import 'package:dimovie/bloc/get_movies_bloc.dart';
import 'package:dimovie/model/movie_response.dart';
import 'package:dimovie/style/theme.dart' as Style;
import 'error_card.dart';
import 'loading_card.dart';
import 'movies_list.dart';

class BestMovies extends StatefulWidget {
  @override
  _BestMoviesState createState() => _BestMoviesState();
}

class _BestMoviesState extends State<BestMovies> {
  @override
  void initState() {
    super.initState();
    moviesBloc..getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "FILMES POPULARES",
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
          stream: moviesBloc.subject.stream,
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
    return ErrorCard(error: error);
  }

  Widget _buildHomeWidget(MovieResponse data) {
    return MoviesList(movies: data.movies);
  }
}
