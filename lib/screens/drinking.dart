import 'dart:math';

import 'package:flutter/material.dart';

class DrinkingScreen extends StatefulWidget {
  const DrinkingScreen({Key? key}) : super(key: key);

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: size.width,
          height: size.height - 150,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => CustomPaint(
              painter: WavePainter(waveAnimation: _animationController),
            ),
          ),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {

  final Animation<double> waveAnimation;
  final Paint _paint = Paint()..color = Colors.green;

  WavePainter({required this.waveAnimation});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(i, (size.height + 10) * waveAnimation.value - (sin((i / size.width * 2 * pi) + ((waveAnimation.value * 10) * 2 * pi)) * 5));
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;

}