import 'package:flutter/material.dart';
import 'package:recipe/shared/color.dart';

class recipebutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      padding: const EdgeInsets.fromLTRB(20, 10, 25, 5),
      color: AppColor.secondaryColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: AppColor.primaryColor,
          fixedSize: const Size(500, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: () {},
        child: const Text(
          'RECIPE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: 19,
          ),
        ),
      ),
      // ),
    );
  }
}
