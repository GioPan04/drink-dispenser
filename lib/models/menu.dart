import 'package:drink_dispenser/models/drink.dart';

class Menu {
  final List<Drink> drinks;

  const Menu({
    required this.drinks,
  });

  factory Menu.fromJson(Map<String,dynamic> data) {
    return Menu(
      drinks: data['drinks'].map<Drink>((data) => Drink.fromJson(data)).toList(),
    );
  }
}