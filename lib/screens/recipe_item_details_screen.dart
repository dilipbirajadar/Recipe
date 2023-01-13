import 'package:flutter/material.dart';

class RecipeItemDetailsScreen extends StatefulWidget {
  const RecipeItemDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RecipeItemDetailsScreen> createState() => _RecipeItemDetailsScreenState();
}

class _RecipeItemDetailsScreenState extends State<RecipeItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipe App"),),
      body: const Center(
        child: Text('Welcome to Recipe Item Details'),
      ),
    );
  }
}
