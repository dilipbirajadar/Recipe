import 'package:flutter/material.dart';
import 'package:recipe/widgets/explore/button_widget.dart';
import 'package:recipe/shared/color.dart';
import 'package:recipe/widgets/explore/grid_view_recipe.dart';
import 'package:recipe/widgets/explore/widget_text_container.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              textrecipe(text: "Explore the recipes and start cooking..."),
              recipegridview(isFavScreen: false),
              const SizedBox(height: 2),
              recipebutton(),
            ],
          ),
        ),
      ),
    );
  }
}
