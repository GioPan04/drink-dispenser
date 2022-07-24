import 'package:drink_dispenser/components/filter.dart';
import 'package:drink_dispenser/components/image_button.dart';
import 'package:drink_dispenser/models/drink.dart';
import 'package:drink_dispenser/providers/menu_provider.dart';
import 'package:drink_dispenser/screens/drink_customizer.dart';
import 'package:flutter/material.dart';

class DrinkChooser extends StatefulWidget {
  const DrinkChooser({Key? key}) : super(key: key);

  @override
  State<DrinkChooser> createState() => _DrinkChooserState();
}

class _DrinkChooserState extends State<DrinkChooser> {

  String? _currentFilter;

  void _customizeDrink(Drink drink) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => DrinkCustomizer(drink: drink)
    ));
  }

  void _onFilter(String filter) {
    setState(() {
      _currentFilter = _currentFilter == filter ? null : filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Drink> drinks = MenuProvider.of(context).menu.drinks;

    if(_currentFilter != null) drinks = drinks.where((d) => d.ingredients.any((element) => element.name == _currentFilter)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scegli il drink'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Filter(label: 'A base di Vodka', onTap: () => _onFilter('Vodka'), active: _currentFilter == 'Vodka'),
                Filter(label: 'A base di Gin', onTap: () => _onFilter('Gin'), active: _currentFilter == 'Gin'),
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 4/5),
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                final Drink drink = drinks[i];
            
                return ImageButton(
                  imageAsset: drink.image,
                  text: drink.name,
                  onClick: () => _customizeDrink(drink)
                );
              },
              childCount: drinks.length
            ),
          )
        ],
      )
    );
  }
}