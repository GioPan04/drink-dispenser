import 'package:drink_dispenser/models/drink.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/drink.jpg', fit: BoxFit.cover, width: 300, height: 200,),
              const Text('Vodka Lemon'),
            ],
          ),
          ...widget.drink.ingredients.asMap().map((i, e) => MapEntry(
            i,
            Slider(
              value: _percentages[i].toDouble(),
              min: 0,
              max: 100,
              divisions: 10,
              label: "${e.name}: ${int.parse((_percentages[i] / 10).toStringAsFixed(0)) * 10}%",
              onChanged: (v) {
                setState(() {
                  _percentages[i] = v;
                  _updateData();
                });
              }
            ),
          )).values.toList()
        ],
      ),
    );
  }
}