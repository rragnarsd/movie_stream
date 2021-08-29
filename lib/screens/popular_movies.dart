import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_stream/models/movie_result_model.dart';

import '../constants.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  _PopularMoviesState createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
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
  }

  @override
  void initState() {
    super.initState();
    jsonData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'),
              )
            ]),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: FutureBuilder<MovieResults>(
              future: jsonData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.results.length,
                      itemBuilder: (context, index) {
                        return Row(children: [
                          Expanded(
                            child: Stack(
                              overflow: Overflow.visible,
                              fit: StackFit.passthrough,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 40.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                    ),
                                    width: 300,
                                    height: 150,
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 260,
                                      padding: EdgeInsets.only(left: 100),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.results[index].title,
                                            style: TextStyle(fontSize: 20.0),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text('Year: ${snapshot.data!.results[index]
                                              .releaseDate
                                              .substring(0, 4)}',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            snapshot.data!.results[index]
                                                .voteAverage
                                                .toString(),
                                            style: TextStyle(fontSize: 26.0),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  top: -30,
                                  height: 220,
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                    ),
                                    child: Container(
                                      child: CachedNetworkImage(
                                        imageUrl: Constants.imageUrl +
                                            snapshot.data!.results[index]
                                                .posterPath,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                          color: Colors.black12,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.23,
                                          color: Theme.of(context).splashColor,
                                          child: Icon(
                                            Icons.error,
                                            color: Theme.of(context)
                                                .iconTheme
                                                .color,
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ]);
                      });
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('${snapshot.error}');
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
