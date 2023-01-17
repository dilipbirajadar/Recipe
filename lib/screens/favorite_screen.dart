import 'package:flutter/material.dart';
import 'package:recipe/shared/color.dart';
import 'package:recipe/widgets/explore/button_widget.dart';
import 'package:recipe/widgets/explore/grid_view_recipe.dart';
import 'package:recipe/widgets/explore/widget_text_container.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
        child: Column(
          children: [
            textrecipe(text: "Your favorite recipes ..."),
            recipegridview(isFavScreen: true),
            const SizedBox(height: 2),
            recipebutton(),
          ],
        ),
      ),
    );
  }
}
