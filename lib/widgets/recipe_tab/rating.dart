import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingsWidget extends StatefulWidget {
  RatingsWidget({required this.rating, super.key});
  double rating = 0.0;

  @override
  State<RatingsWidget> createState() => _RatingsWidgetState();
}

class _RatingsWidgetState extends State<RatingsWidget> {
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    return RatingBar(
        ignoreGestures: true,
        initialRating: widget.rating,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        ratingWidget: RatingWidget(
            full: const Icon(Icons.star, color: Color(0xfff6836b)),
            half: const Icon(
              Icons.star_half,
              color: Color(0xfff6836b),
            ),
            empty: const Icon(
              Icons.star_outline,
              color: Color(0xfff6836b),
            )),
        onRatingUpdate: (value) {});
  }
}
