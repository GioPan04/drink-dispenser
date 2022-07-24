import 'package:drink_dispenser/models/drink.dart';
import 'package:drink_dispenser/models/drink_ingredient.dart';
import 'package:flutter/material.dart';

class DrinkCustomizer extends StatefulWidget {
  final Drink drink;

  const DrinkCustomizer({required this.drink, Key? key}) : super(key: key);

  @override
  State<DrinkCustomizer> createState() => _DrinkCustomizerState();
}

class _DrinkCustomizerState extends State<DrinkCustomizer> {

  late List<double> _percentages;

  @override
  void initState() {
    _percentages = widget.drink.ingredients.map((e) => e.percentage.toDouble()).toList();
    super.initState();
  }

  void _updateData() {
    double sum = _percentages.fold(0, (previousValue, element) => previousValue + element);

    for (var j = 0; j < _percentages.length; j++) {
      if (_percentages[j] != sum) {
        _percentages[j] = (_percentages[j] / sum) * 100;
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    final Drink drink = widget.drink;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Image.asset(drink.image, fit: BoxFit.cover, width: 150, height: 100,),
                  Text(drink.name),
                ],
              ),

              ..._buildSliders()
            ],
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.local_bar),
                label: const Text("Prepara", style: TextStyle(fontSize: 18),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16.0))
                ),
              ),
            )
          )
        ],
      ),
    );
  }

  List<Widget> _buildSliders() {
    return widget.drink.ingredients.asMap().map((i, e) {
      final double percentage = _percentages[i].toDouble();
      final String label = "${e.name}: ${int.parse((_percentages[i] / 10).toStringAsFixed(0)) * 10}%";

      return MapEntry(
        i,
        Row(
          children: [
            Text(e.name),
            Expanded(
              child: Slider(
                value: percentage,
                min: 0,
                max: 100,
                divisions: 10,
                label: label,
                onChanged: (v) {
                  setState(() {
                    _percentages[i] = v;
                    _updateData();
                  });
                }
              ),
            ),
          ],
        ),
      );
    }).values.toList();
  }
}