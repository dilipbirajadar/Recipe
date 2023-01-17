import 'package:flutter/material.dart';
import 'package:recipe/screens/account_screen.dart';
import 'package:recipe/screens/explore_screen.dart';
import 'package:recipe/screens/favorite_screen.dart';
import 'package:recipe/screens/recipe_item_details_screen.dart';
import 'package:recipe/screens/welcome_screen.dart';
import 'package:recipe/theme/custom_theme/custom_theme.dart';
import 'package:recipe/screens/landing_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const MyLogin(), //ExploreScreen(),
    //theme: CustomTheme.appCustomTheme,
    routes: {
      '/welcome': (context) => const WelcomeScreen(),
      '/explore': (context) => ExploreScreen(),
      '/favorite': (context) => const FavoriteScreen(),
      '/account': (context) => const AccountScreen(),
      '/recipe_details': (context) => const RecipeDetailsScreen(),
    },
  ));
}
