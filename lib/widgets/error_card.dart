import 'package:flutter/material.dart';
import 'package:dimovie/style/theme.dart' as Style;

class ErrorCard extends StatefulWidget {
  final String error;

  ErrorCard({Key key, @required this.error}) : super(key: key);

  @override
  _ErrorCardState createState() => _ErrorCardState(error);
}

class _ErrorCardState extends State<ErrorCard> {
  final String error;

  _ErrorCardState(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ocorreu um erro: $error"),
          ],
        ));
  }
}
