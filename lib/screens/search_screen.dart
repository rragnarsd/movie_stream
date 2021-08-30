import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/models/movie_result_model.dart';
import 'package:movie_stream/service/api_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textController = TextEditingController(text: '');
  late Future<MovieResults> jsonData;

/*
  Future<MovieResults> searchMovies() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=${dotenv.get('API_KEY')}&query=" +
            textController.text

        */
/*Constants.baseUrl +
        Constants.searchMovies +
        dotenv.get('API_PARAM') +
        dotenv.get('API_KEY') + textController.text */ /*

        ));

    if (response.statusCode == 200) {
      return MovieResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
*/

  Map? mapResponse;
  List? listOfResponse;

  Future<MovieResults> searchMovies() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=${dotenv.get('API_KEY')}&query=" +
            textController.text));
    if (response.statusCode == 200) {
      return MovieResults.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    jsonData = searchMovies();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      child: TextField(
                        controller: textController,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          fillColor:
                              Theme.of(context).splashColor.withOpacity(0.1),
                          filled: true,
                          hintText: 'Search for a movie...',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                          ),
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            onPressed: () {
                              setState(() {
                                textController.clear();
                              });
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2.5,
                              color: Theme.of(context).splashColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    onTap: () => searchMovies(),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).iconTheme.color,
                        shape: BoxShape.rectangle,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  )
                ],
              ),
              FutureBuilder<MovieResults>(
                  future: jsonData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(itemBuilder: (context, index) {
                        return Container(
                          child: Text(snapshot.data!.results[index].title),
                        );
                      });
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text('${snapshot.error}');
                    }
                    return Center(child: CircularProgressIndicator());
                  })
            ])),
      ),
    );
  }
}
