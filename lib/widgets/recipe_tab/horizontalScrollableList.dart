import 'package:flutter/material.dart';
import 'package:recipe/shared/color.dart';

class HorizontalListWidget extends StatefulWidget {
  HorizontalListWidget({required this.ingredients, super.key});
  List<dynamic> ingredients = [];

  @override
  State<HorizontalListWidget> createState() => _HorizontalListWidgetState();
}

class _HorizontalListWidgetState extends State<HorizontalListWidget> {
  var tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    // setState(() {});

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.ingredients.length,
      padding: EdgeInsets.all(1),
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          setState(() {
            tappedIndex = index;
          });
        },
        child: Container(
            decoration: BoxDecoration(
              color: (tappedIndex == index)
                  ? AppColor.primaryColor
                  : AppColor.tertiaryColor.withOpacity(0.3),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              //  color: Colors.grey.shade200.withOpacity(0.7),
            ),
            margin: const EdgeInsets.only(left: 30, top: 25),
            width: deviceWidth(context) * 0.2,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.ingredients[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: (tappedIndex == index) ? Colors.white : Colors.black,
                    fontSize: deviceHeight(context) * 0.014,
                    fontWeight: FontWeight.w600),
              ),
            )),
      ),
    );
  }
}


