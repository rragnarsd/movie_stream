import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/screens/coming_soon.dart';
import 'package:movie_stream/screens/popular_movie.dart';
import 'package:movie_stream/screens/toprated_movies.dart';


class MovieCategory extends StatefulWidget {
  const MovieCategory({Key? key}) : super(key: key);

  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50.0,),
          Container(
            height: 50,
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: 'Popular Movies',
                ),
                Tab(
                  text: 'Top Rated',
                ),
                Tab(
                  text: 'Coming Soon',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: PopularMovies()),
                Center(child: TopRatedMovies()),
                Center(child: ComingSoon()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
