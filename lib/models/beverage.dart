class Beverage {
  final String name;
  final String image;
  final int pin;

  const Beverage({
    required this.name,
    required this.image,
    required this.pin
  });

  factory Beverage.fromJson(Map<String,dynamic> data) {
    return Beverage(
      name: data['name'],
      image: data['image'],
      pin: data['pin']
    );
  }
}