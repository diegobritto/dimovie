import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dimovie/style/theme.dart' as Style;
import 'package:dimovie/widgets/best_movies.dart';
import 'package:dimovie/widgets/genres.dart';
import 'package:dimovie/widgets/now_playing.dart';
import 'package:dimovie/widgets/persons.dart';

import 'home_screen.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    GenresScreen(),
    PersonsList(),
    BestMovies(),
    NowPlaying(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        title: Text("Dimovie"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Style.Colors.mainColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Style.Colors.mainColor,
            icon: Icon(Icons.home),
            title: Text('Principal'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            backgroundColor: Style.Colors.mainColor,
            title: Text('Gênero'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Style.Colors.mainColor,
            icon: Icon(Icons.people),
            title: Text('Atores'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Style.Colors.mainColor,
            icon: Icon(EvaIcons.heart),
            title: Text('Populares'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Style.Colors.mainColor,
            icon: Icon(Icons.search),
            title: Text('Pesquisar'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Style.Colors.titleColor,
        selectedItemColor: Style.Colors.secondColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
