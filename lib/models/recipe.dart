
class RecipeData {
  String description = "";
  String imageName = "";
  String method = "";
  String name = "";
  double rating = 0.0;
  bool isFavorite = false;
  List<dynamic> ingredients = [];

  RecipeData(this.description, this.imageName, this.method, this.name,
      this.rating, this.ingredients, this.isFavorite);

  RecipeData.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        imageName = json['image-name'],
        method = json['method'],
        name = json['name'],
        rating = json['rating'],
        ingredients = json['ingredients'],
        isFavorite = json['isFavorite'];

  // convert RecipeData to json
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'image-name': imageName,
      'method': method,
      'name': name,
      'rating': rating,
      'ingredients': ingredients,
      'isFavorite': isFavorite,
    };
  }
}
