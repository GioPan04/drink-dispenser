import 'dart:math';
import 'package:flutter/material.dart';


class AnimatedWave extends StatelessWidget {

  final Animation<double> animation;

  const AnimatedWave({Key? key, required this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => CustomPaint(
        painter: WavePainter(waveAnimation: animation),
      ),
    );
  }
}

class WavePainter extends CustomPainter {

  final Animation<double> waveAnimation;
  final Paint _paint = Paint()..color = Colors.green;
  final int _waveMultiplier = 5;

  WavePainter({required this.waveAnimation});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    for (double i = 0.0; i < size.width; i++) {
      final double position = (size.height + 10) * waveAnimation.value;
      final double wave = sin((i / size.width * 2 * pi) + ((waveAnimation.value * 10) * 2 * pi)) * _waveMultiplier;
      path.lineTo(i, position - wave);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) => true;

}