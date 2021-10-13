import 'package:flutter/material.dart';
import 'package:movie_ticket/constants/constants.dart';
import 'package:movie_ticket/data/data.dart';
import 'package:movie_ticket/widget/genres_format.dart';
import 'package:movie_ticket/widget/star_rating.dart';

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
          ),

          GenresFormat(movieData.movieList[widget.index].genre, white),
          SizedBox(
            height: size.height * 0.005,
          ),
          StarRating(movieData.movieList[widget.index].rating),
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            width: size.width * 0.25,
            height: 1.0,
            color: secondary.withOpacity(0.5),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),

          Container(
            width: size.width * 0.25,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              color: secondary,
              borderRadius:BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text('BUY TICKET', style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold
              ),),
            ),
          ),

          SizedBox(
            height: size.height * 0.01,
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image(
              image: movieData.movieList[widget.index].image.image,
              width: size.width * 0.5,
              height: size.height * 0.35,
            ),
          ),

          SizedBox(
            height: size.height * 0.02,
          ),

          Text(
            movieData.movieList[widget.index].name,
            style: TextStyle(
              color: white,
              fontSize: size.width / 14,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}
