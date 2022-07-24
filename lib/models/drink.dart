import 'package:drink_dispenser/models/drink_ingredient.dart';

class Drink {
  final String name;
  final String image;
  final List<DrinkIngredient> ingredients;

  const Drink({
    required this.name,
    required this.image,
    required this.ingredients
  });

  factory Drink.fromJson(Map<String,dynamic> data) {
    return Drink(
      name: data['name'],
      image: data['image'],
      ingredients: data['ingredients'].map((data) => DrinkIngredient.fromJson(data)).toList()
    );
  }
}