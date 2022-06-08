import 'dart:core';
import 'package:flutter/material.dart';
import 'package:jobsheet7/services/http_service.dart';

class MovieList extends StatefulWidget {
  MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
  late HttpService service;
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List? movies;
  HttpService? service;
  bool? _isLoading = true;

  // Future initalize() async {
  //   movies = [];
  //   movies = (await service!.getPopularMovies())!;
  //   setState(() {
  //     moviesCount = movies!.length;
  //     movies = movies;
  //   });
  // }
  Future initialize() async {
    service!.getPopularMovies().then((value) => {
          setState(() {
            movies = value!;
            moviesCount = movies!.length;
            _isLoading = false;
          })
        });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Popular Movies"),
        ),
        body: ListView.builder(
          itemCount: (moviesCount == null) ? 0 : moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                title: Text(movies![position].title),
                subtitle: Text(
                  'Rating = ' + movies![position].voteAverage.toString(),
                ),
              ),
            );
          },
        ));
  }
}
