import 'package:dimovie/screens/movie_detail_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dimovie/model/movie.dart';
import 'package:dimovie/style/theme.dart' as Style;

class Rating extends StatefulWidget {
  final double rating;

  Rating({Key key, @required this.rating}) : super(key: key);

  @override
  _RatingState createState() => _RatingState(rating);
}

class _RatingState extends State<Rating> {
  final double rating;

  _RatingState(this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          rating.toString(),
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5.0,
        ),
        RatingBar(
          itemSize: 12.0,
          initialRating: rating / 2,
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
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
