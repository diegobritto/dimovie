import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dimovie/model/movie.dart';
import 'package:dimovie/style/theme.dart' as Style;

class MovieCard extends StatefulWidget {
  final Movie movie;

  MovieCard({Key key, @required this.movie}) : super(key: key);

  @override
  _MovieState createState() => _MovieState(movie);
}

class _MovieState extends State<MovieCard> {
  final Movie movie;

  _MovieState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                //builder: (context) => MovieDetailScreen(movie: movies[index]),
                ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            movie.poster == null
                ? Container(
                    width: 120.0,
                    height: 180.0,
                    decoration: new BoxDecoration(
                      color: Style.Colors.secondColor,
                      borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          EvaIcons.filmOutline,
                          color: Colors.white,
                          size: 60.0,
                        )
                      ],
                    ),
                  )
                : Container(
                    width: 120.0,
                    height: 180.0,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      shape: BoxShape.rectangle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w200/" +
                                  movie.poster)),
                    )),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  movie.rating.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5.0,
                ),
                RatingBar(
                  itemSize: 12.0,
                  initialRating: movie.rating / 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => Icon(
                    EvaIcons.heart,
                    color: Style.Colors.secondColor,
                  ),
                  unratedColor: Style.Colors.starsColorUnselected,
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
