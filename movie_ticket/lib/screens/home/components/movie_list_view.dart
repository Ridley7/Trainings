import 'package:flutter/material.dart';
import 'package:movie_ticket/data/data.dart';
import 'package:movie_ticket/screens/home/components/movie_index.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MovieListView extends StatefulWidget {

  final double movieItemWidth;

  MovieListView(this.movieItemWidth);

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {

  var movieData = MovieData();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      child: ScrollSnapList(
        onItemFocus: (item){
        },
        itemSize: widget.movieItemWidth,
        padding: EdgeInsets.zero,
        itemCount: movieData.movieList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return MovieIndex(index, widget.movieItemWidth);
        },
      ),
    );
  }
}
