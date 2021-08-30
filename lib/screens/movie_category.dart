import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/screens/coming_soon.dart';
import 'package:movie_stream/screens/popular_movie.dart';
import 'package:movie_stream/screens/profile_screen.dart';
import 'package:movie_stream/screens/search_screen.dart';
import 'package:movie_stream/screens/trending_movies.dart';

class MovieCategory extends StatefulWidget {
  const MovieCategory({Key? key}) : super(key: key);

  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  int index = 0;

  final pages = [MovieCategory(), TopRatedMovies(), ComingSoon()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: Icon(Icons.search, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 10.0),
                child: InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()))
                ),
              ),
            ],
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'Coming Soon',
                ),
                Tab(text: 'Top Rated'),
                Tab(
                  text: 'Popular',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ComingSoon(),
              TopRatedMovies(),
              TrendingMovies(),
            ],
          ),
      ),
    );
  }
}
