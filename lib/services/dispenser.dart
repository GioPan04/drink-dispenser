import 'package:flutter_gpiod/flutter_gpiod.dart';

typedef ComplexDrink = MapEntry<int,int>;

class DispenderService {
  static final _chip = FlutterGpiod.instance.chips.singleWhere((chip) => chip.label == 'pinctrl-bcm2835');
  static const String _consumer = 'drink_dispenser';
  static const Duration _fullCapDuration = Duration(seconds: 5);

  static Future<void> simpleDrink(int pin, [Duration? duration]) async {
    final line = _chip.lines[pin];

    line.requestOutput(consumer: _consumer, initialValue: true);
    await Future.delayed(duration ?? _fullCapDuration);
    line.setValue(false);
    line.release();
  }

  static Future<void> complexDrink(List<ComplexDrink> ingredients) async {
    await Future.wait(ingredients.map((e) => simpleDrink(e.key, _generateDuration(e.value))));
  }

  static Duration _generateDuration(int percentage) {
    final int mills = (_fullCapDuration.inMilliseconds / percentage * 100).toInt();
    return Duration(milliseconds: mills);
  }
}