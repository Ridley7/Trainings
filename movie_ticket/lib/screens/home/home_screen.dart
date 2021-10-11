import 'package:flutter/material.dart';
import 'package:movie_ticket/constants/constants.dart';
import 'package:movie_ticket/screens/home/components/background_list_view.dart';
import 'package:movie_ticket/screens/home/components/movie_list_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        children: [
          //Background of home screen
          BackgroundListView(),

          //Movie detail List view
          MovieListView(movieItemWidth)
        ],
      ),
    );
  }
}
