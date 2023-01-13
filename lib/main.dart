import 'package:flutter/material.dart';
import 'package:receipe/screens/account_screen.dart';
import 'package:receipe/screens/explore_screen.dart';
import 'package:receipe/screens/favorite_screen.dart';
import 'package:receipe/screens/welcome_screen.dart';
import 'package:receipe/theme/custom_theme/custom_theme.dart';

void main() {
  runApp(MaterialApp(
    home: const ExploreScreen(),
    //theme: CustomTheme.appCustomTheme,
    routes: {
      '/welcome':(context)=> const WelcomeScreen(),
      '/explore':(context)=> const ExploreScreen(),
      '/favorite':(context)=> const FavoriteScreen(),
      '/account':(context)=> const AccountScreen(),
    },
  ));
}
