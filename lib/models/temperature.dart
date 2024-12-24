import 'dart:math';

import 'package:mobx/mobx.dart';

part 'temperature.g.dart';

class Temperature = _Temperature with _$Temperature;

abstract class _Temperature with Store {
  @observable
  int moonsTemperature = -20;

  @observable
  int earthTemperature = 15;

  @action
  void fetchTemperatureData() {
    final Random random = Random();
    moonsTemperature = random.nextInt(60) - 50;
    earthTemperature = random.nextInt(30) - 10;
  }
}
