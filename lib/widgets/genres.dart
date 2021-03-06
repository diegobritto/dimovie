import 'package:flutter/material.dart';
import 'package:dimovie/bloc/get_genres_bloc.dart';
import 'package:dimovie/model/genre.dart';
import 'package:dimovie/model/genre_response.dart';

import 'error_card.dart';
import 'genres_list.dart';
import 'loading_card.dart';

class GenresTab extends StatefulWidget {
  @override
  _GenresTabState createState() => _GenresTabState();
}

class _GenresTabState extends State<GenresTab> {
  @override
  void initState() {
    super.initState();
    genresBloc.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreResponse>(
      stream: genresBloc.subject.stream,
      builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
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

  Widget _buildHomeWidget(GenreResponse data) {
    List<Genre> genres = data.genres;
    if (genres.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return GenresList(
        genres: genres,
      );
  }
}
