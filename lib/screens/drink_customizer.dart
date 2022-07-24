import 'package:flutter/material.dart';

class DrinkCustomizer extends StatefulWidget {
  const DrinkCustomizer({Key? key}) : super(key: key);

  @override
  State<DrinkCustomizer> createState() => _DrinkCustomizerState();
}

class _DrinkCustomizerState extends State<DrinkCustomizer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/drink.jpg', fit: BoxFit.cover, width: 300, height: 200,),
              const Text('Vodka Lemon'),
            ],
          ),
        ],
      ),
    );
  }
}