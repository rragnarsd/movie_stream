import 'package:flutter/material.dart';
import 'package:movie_stream/models/reviews.dart';

import '../style_constants.dart';

class ReviewsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Container(
              decoration: kBorderRadiusWithShadows,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviews[index]['name'],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0, letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Rating ${reviews[index]['rating']}',
                      style: TextStyle(color: Colors.grey.shade600, letterSpacing: 1.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      reviews[index]['overview'],
                      style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
