import 'package:flutter/material.dart';
import 'package:movie_ticket/constants/constants.dart';
import 'package:movie_ticket/data/data.dart';

class MovieIndex extends StatefulWidget {

  final int index;
  final double movieItemWidth;

  MovieIndex(this.index, this.movieItemWidth);

  @override
  _MovieIndexState createState() => _MovieIndexState();
}

class _MovieIndexState extends State<MovieIndex> {

  var movieData = MovieData();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.008,
          ),

          Container(
            height: size.height * 0.15,
            child: Align(
              alignment: Alignment.center,
              child: Image(
                width: size.width / 2.5,
                image: movieData.movieList[widget.index].imageLogo.image,
              ),
            ),
          )
        ],
      ),
    );
  }
}
