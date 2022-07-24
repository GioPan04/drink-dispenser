import 'package:drink_dispenser/models/beverage.dart';
import 'package:drink_dispenser/models/drink.dart';

class Menu {
  final List<Drink> drinks;
  final List<Beverage> beverages;

  const Menu({
    required this.drinks,
    required this.beverages,
  });

  factory Menu.fromJson(Map<String,dynamic> data) {
    return Menu(
      drinks: data['drinks'].map<Drink>((data) => Drink.fromJson(data)).toList(),
      beverages: data['beverages'].map<Beverage>((data) => Beverage.fromJson(data)).toList(),
    );
  }
}