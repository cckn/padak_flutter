import "package:flutter/material.dart";
import 'package:padak_starter/model/response/movie_response.dart';

import "./model/data/dummy.dart";

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child: FutureBuilder(
//            // GET /movies
//            future: loadMoviesData('assets/get_movies_dummy.json'),
//            builder: (context, snapshot) {
//              if (snapshot.connectionState == ConnectionState.done) {
//                final MoviesResponse data = snapshot.data;
//                return Text(data.movies[0]["date"]);
//              } else {
//                return Text("");
//              }
//            },

          // GET /movie
          future: loadMovieData('assets/get_movie_dummy_0.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final MovieResponse data = snapshot.data;
              return Text(data.date);
            } else {
              return Text("");
            }
          },

//            // GET /comments
//            future: loadCommentsData('assets/get_comments_dummy_0.json'),
//            builder: (context, snapshot) {
//              if (snapshot.connectionState == ConnectionState.done) {
//                final CommentsResponse data = snapshot.data;
//                return Text(data.comments[0]['contents']);
//              } else {
//                return Text("");
//              }
//            },
        ),
      ),
    );
  }
}