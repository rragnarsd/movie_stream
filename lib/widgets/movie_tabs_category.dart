import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_stream/widgets/coming_soon.dart';
import 'package:movie_stream/widgets/popular_movie.dart';
import 'package:movie_stream/widgets/toprated_movies.dart';


class MovieTabsCategory extends StatefulWidget {
  const MovieTabsCategory({Key? key}) : super(key: key);

  @override
  _MovieTabsCategoryState createState() => _MovieTabsCategoryState();
}

class _MovieTabsCategoryState extends State<MovieTabsCategory>
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
              indicatorColor: Color(0xffBD4B4B),
              labelColor: Color(0xffEEEEEE),
              unselectedLabelColor: Color(0xfff5f5f5),
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
