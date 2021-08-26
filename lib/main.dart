import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'constants.dart';
import 'models/movie.dart';

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
      home: SearchMovie(),
    );
  }
}

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  Movies? jsonResponse;

  Future<Movies>? fetchData() async {
    var response = await http.get(Uri.parse(Constants.baseUrl +
        Constants.popularMovies +
        dotenv.get('API_PARAM') +
        dotenv.get('API_KEY')));

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
  /*    Map<String, dynamic> jsonResponse = new Map<String, dynamic>.from(json.decode(response.body));*/
      print(jsonResponse);
    }
    return jsonResponse;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Movies>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              print(snapshot.data);
              return Text('Loading');
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.results.length,
                      itemBuilder: (context, index) {
                        return Text(snapshot.data!.results[index].title);
                      });
                } else {
                  return Text('No data');
                }
              }
            }
          },
        ),
      ),
    );
  }
}
