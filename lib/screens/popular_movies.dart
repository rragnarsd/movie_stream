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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text('Popular', style: TextStyle(fontSize: 20.0)),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Toprated', style: TextStyle(fontSize: 20.0)),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Upcoming', style: TextStyle(fontSize: 20.0)),
                  ],
                ),
                SizedBox(height: 20.0,),
                ReusableBuilder(jsonData: jsonData),
              ]),
        ),
      ),
    );
  }
}

class ReusableBuilder extends StatelessWidget {
  const ReusableBuilder({
    Key? key,
    required this.jsonData,
  }) : super(key: key);

  final Future<MovieResults> jsonData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieResults>(
      future: jsonData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 150.0,
                      color: Colors.grey.shade200,
                      child: Row(children: [
                        Container(
                          width: 100.0,
                          child: CachedNetworkImage(
                            imageUrl: Constants.imageUrl +
                                snapshot.data!.results[index].posterPath,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.black12,
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: MediaQuery.of(context).size.width * 0.23,
                              color: Theme.of(context).splashColor,
                              child: Icon(
                                Icons.error,
                                color: Theme.of(context).iconTheme.color,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(snapshot.data!.results[index].title),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(snapshot.data!.results[index].releaseDate),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(snapshot.data!.results[index].voteAverage
                                .toString())
                          ],
                        )
                      ]),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Text('${snapshot.error}');
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
