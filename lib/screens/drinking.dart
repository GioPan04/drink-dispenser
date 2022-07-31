import 'package:drink_dispenser/components/animated_wave.dart';
import 'package:flutter/material.dart';

class DrinkingScreen extends StatefulWidget {

  final String name;

  const DrinkingScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<DrinkingScreen> createState() => _DrinkingScreenState();
}

class _DrinkingScreenState extends State<DrinkingScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    Duration duration = const Duration(seconds: 20);
    _animationController = AnimationController(vsync: this, duration: duration);
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed) Navigator.popUntil(context, (route) => route.isFirst);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedWave(animation: _animationController)
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Eragazione ${widget.name}"),
                const SizedBox(
                  height: 50
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  label: const Text("Annulla"),
                  icon: const Icon(Icons.cancel, size: 16,),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}

