import 'package:flutter/material.dart';
import 'package:dimovie/style/theme.dart' as Style;

class LoadingCard extends StatefulWidget {
  @override
  _LoadingCardState createState() => _LoadingCardState();
}

class _LoadingCardState extends State<LoadingCard> {


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.0,
              width: 25.0,
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 4.0,
              ),
            )
          ],
        ));
  }
}
