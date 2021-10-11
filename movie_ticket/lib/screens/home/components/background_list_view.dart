import 'package:flutter/material.dart';
import 'package:movie_ticket/constants/constants.dart';
import 'package:movie_ticket/data/data.dart';

class BackgroundListView extends StatefulWidget {
  @override
  _BackgroundListViewState createState() => _BackgroundListViewState();
}

class _BackgroundListViewState extends State<BackgroundListView> {

  var movieData = MovieData();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ListView.builder(
      padding: EdgeInsets.zero,
        itemCount: movieData.movieList.length,
        scrollDirection: Axis.horizontal,
      itemBuilder: (context, index){
        return Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -size.width / 3,
                  right: -size.width / 3,
                  child: Image(
                      image: movieData.movieList[index].image.image
                  ),
              ),

              Container(
                color: black.withOpacity(0.4),
              ),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      black.withOpacity(0.3),
                      black.withOpacity(0.95)
                    ],

                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.5, 0.9]
                  )
                ),
              )

            ],
          )
        );
      },
    );
  }
}
