import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dimovie/bloc/get_person_bloc.dart';
import 'package:dimovie/model/person.dart';
import 'package:dimovie/model/person_response.dart';
import 'package:dimovie/style/theme.dart' as Style;

import 'error_card.dart';
import 'loading_card.dart';

class PersonsList extends StatefulWidget {
  @override
  _PersonsListState createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {
  @override
  void initState() {
    super.initState();
    personBloc.getPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "ATORES POPULARES",
            style: TextStyle(
                color: Style.Colors.titleColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        StreamBuilder<PersonResponse>(
          stream: personBloc.subject.stream,
          builder: (context, AsyncSnapshot<PersonResponse> snapshot) {
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

  Widget _buildHomeWidget(PersonResponse data) {
    List<Person> persons = data.persons;
    if (persons.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Não há mais pessoas...",
                  style: TextStyle(color: Style.Colors.titleColor),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        height: 116.0,
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: persons.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(top: 10.0, right: 8.0),
              width: 100.0,
              child: GestureDetector(
                onTap: () {

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    persons[index].profileImg == null
                        ? Hero(
                            tag: persons[index].id,
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Style.Colors.secondColor),
                              child: Icon(
                                FontAwesomeIcons.userAlt,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Hero(
                            tag: persons[index].id,
                            child: Container(
                                width: 70.0,
                                height: 70.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w300/" +
                                              persons[index].profileImg)),
                                )),
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      persons[index].name,
                      maxLines: 2,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  }
}
