class DrinkIngredient {
  final String name;
  final int pin;
  final int percentage;

  const DrinkIngredient({
    required this.name,
    required this.percentage,
    required this.pin
  });

  factory DrinkIngredient.fromJson(Map<String,dynamic> data) {
    return DrinkIngredient(
      name: data['name'],
      percentage: data['percentage'],
      pin: data['pin'],
    );
  }
}