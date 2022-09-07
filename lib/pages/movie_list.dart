import 'package:httprequestrestapiflutter/service/http_service.dart';
import 'package:flutter/material.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  // String result = "";
  int moviesCount = 0;
  late List movies;
  HttpService service = HttpService();
  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  // Widget build(BuildContext context) {
  //   service.getPopularMovies().then((value) => {
  //         setState(() {
  //           result = value!;
  //         })
  //       });
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Movie List'),
  //     ),
  //     body: Center(
  //       child: Text(result),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: ListView.builder(
          itemCount: moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                title: Text(movies[position].title),
                subtitle: Text(
                  'Rating = ' + movies[position].voteAverage.toString(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
