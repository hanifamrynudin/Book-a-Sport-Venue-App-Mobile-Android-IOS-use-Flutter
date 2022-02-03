import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  @override

  final int index;
  final int rating;

  RatingItem({this.rating,this.index});

  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating ? 'assets/Icon_star.png' : 'assets/Icon_star_grey.png',
      width: 20,
    );
  }
}