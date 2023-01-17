import 'package:flutter/material.dart';
import 'package:recipe/services/api_helper.dart';
import 'package:recipe/shared/color.dart';
import 'package:recipe/widgets/recipe_tab/favorite.dart';
import 'package:recipe/widgets/recipe_tab/horizontalScrollableList.dart';
import 'package:recipe/widgets/recipe_tab/rating.dart';

import '../models/recipe.dart';

class RecipeDetailsScreen extends StatefulWidget {
  const RecipeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreen();
}

class _RecipeDetailsScreen extends State<RecipeDetailsScreen> {
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final recipeData = arguments['recipe_data'] as RecipeData;
    final index = arguments['index'] as int;
    print("recipe_data");
    print(recipeData.imageName);

    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height - 60;
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;

    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
          title: Text('Recipe Details'),
          backgroundColor: AppColor.primaryColor),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: deviceHeight(context) * 0.25,
              width: deviceWidth(context) * 1,
              child: Image(
                image: AssetImage('images/${recipeData.imageName}.png'),
                fit: BoxFit.fill,
              ),
            ),
            Container(
                height: deviceHeight(context) * 0.07,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: deviceWidth(context) * 0.5,
                        child: Center(
                          child: Text(
                            recipeData.name,
                            style: const TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                    Center(
                      child: FavoriteWidget(
                        isFavorite: recipeData.isFavorite,
                        onTap: (bool isFav) {
                          recipeData.isFavorite = isFav;
                          print(recipeData.imageName);
                          ApiHelper().updateCurrentRecipeInformation(
                              recipeData, index);
                        },
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              width: deviceWidth(context),
              height: deviceHeight(context) * 0.055,
              color: Colors.white,
              padding: EdgeInsets.only(
                left: deviceWidth(context) * 0.01,
              ),
              child: RatingsWidget(rating: recipeData.rating),
            ),
            Container(
                width: deviceWidth(context),
                height: deviceHeight(context) * 0.18,
                color: Colors.white,
                padding: EdgeInsets.only(
                  top: deviceHeight(context) * 0.04,
                  left: deviceWidth(context) * 0.1,
                ),
                child: Text(
                  recipeData.description,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                )),
            Container(
              height: deviceHeight(context) * 0.15,
              width: deviceWidth(context),
              color: Colors.white,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: deviceHeight(context) * 0.01, left: 30, right: 30),
                    child: Text(
                      'Ingredients',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                      child: HorizontalListWidget(
                          ingredients: recipeData.ingredients)),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: deviceHeight(context) * 0.261,
              width: deviceWidth(context),
              child: Column(
                children: [
                  Container(
                    width: deviceWidth(context),
                    margin: EdgeInsets.only(
                        top: deviceHeight(context) * 0.05, left: 30, right: 30),
                    child: Text(
                      'Recipe',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Text(
                            recipeData.method,
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
