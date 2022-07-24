import 'package:flutter/material.dart';

class TypeChooser extends StatefulWidget {
  const TypeChooser({Key? key}) : super(key: key);

  @override
  State<TypeChooser> createState() => _TypeChooserState();
}

class _TypeChooserState extends State<TypeChooser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Cosa preferisci?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Bevanda')),
                ElevatedButton(onPressed: () {}, child: const Text('Drink')),
              ],
            )
          ],
        ),
      ),
    );
  }
}