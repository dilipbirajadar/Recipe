import 'package:flutter/material.dart';
import 'package:recipe/shared/color.dart';

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({required this.isFavorite, required this.onTap, super.key});
  bool isFavorite = false;
  final Function(bool) onTap;

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  int _favoriteCount = 0;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    void toggleFavorite() {
      setState(() {
        if (widget.isFavorite) {
          _favoriteCount -= 1;
          widget.isFavorite = false;
        } else {
          _favoriteCount += 1;
          widget.isFavorite = true;
        }
      });
      widget.onTap(widget.isFavorite);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (widget.isFavorite
                ? Icon(
                    Icons.favorite,
                    size: deviceHeight(context) * 0.06,
                  )
                : Icon(Icons.favorite_border,
                    size: deviceHeight(context) * 0.06)),
            color: AppColor.primaryColor,
            onPressed: toggleFavorite,
          ),
        ),
      ],
    );
  }
}
