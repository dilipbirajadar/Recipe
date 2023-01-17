import 'package:flutter/material.dart';
import 'package:recipe/screens/recipe_item_details_screen.dart';
import 'package:recipe/services/api_helper.dart';
import 'package:recipe/shared/color.dart';

import '../../models/recipe.dart';

class recipegridview extends StatefulWidget {
  bool isFavScreen = false;
  recipegridview({required this.isFavScreen, super.key});

  @override
  State<recipegridview> createState() => _recipegridviewState();
}

class _recipegridviewState extends State<recipegridview> {
  late Future<List<RecipeData>> _future;
  final String urlExplore =
      "https://flutter-receipe-default-rtdb.firebaseio.com/recipes.json";
  final String urlFavorite =
      "https://flutter-receipe-default-rtdb.firebaseio.com/favorite.json";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String url = "";
    // if (widget.isFavScreen) {
    //   url = urlFavorite;
    // } else {
    //   url = urlExplore;
    // }
    _future = ApiHelper().getRecipe(widget.isFavScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (((MediaQuery.of(context).size.height) * 2 / 3) - 50),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 1, right: 1),
      color: AppColor.secondaryColor,
      child: FutureBuilder<List<RecipeData>>(
        future: _future,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.all(15),
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: 0.2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: InkWell(
                            onTap: () {
                              print("card ${index} is tapped.");
                              Navigator.pushNamed(
                                context,
                                '/recipe_details',
                                arguments: {
                                  'recipe_data': snapshot.data?[index],
                                  'index': index,
                                },
                              );
                              //RecipeDetailsScreen();
                            },
                            child: //Text('${snapshot.data?[index].name}'),
                                Image.asset(
                              'images/${snapshot.data?[index].imageName}.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Text("Loading...");
        }),
      ),
    );
  }
}
