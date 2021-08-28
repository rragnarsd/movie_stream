import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'constants.dart';
import 'models/movie_result_model.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: /*LandingScreen()*/
          SearchMovie(),
    );
  }
}

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  late Future<MovieResults> jsonData;

  Future<MovieResults> fetchData() async {
    final response = await http.get(Uri.parse(Constants.baseUrl +
        Constants.popularMovies +
        dotenv.get('API_PARAM') +
        dotenv.get('API_KEY')));

    if (response.statusCode == 200) {
      return MovieResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
/*  return data;*/
  }

  @override
  void initState() {
    super.initState();
    jsonData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<MovieResults>(
          future: jsonData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return ListView.builder(
                    itemCount: snapshot.data!.results.length,
                    itemBuilder: (context, index) {
                      return Column(children: [Text(snapshot.data!.results[index].title), Text(snapshot.data!.results[index].overview)]);
                    });
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('${snapshot.error}');
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
