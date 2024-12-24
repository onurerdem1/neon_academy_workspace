// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Temperature on _Temperature, Store {
  late final _$moonsTemperatureAtom =
      Atom(name: '_Temperature.moonsTemperature', context: context);

  @override
  int get moonsTemperature {
    _$moonsTemperatureAtom.reportRead();
    return super.moonsTemperature;
  }

  @override
  set moonsTemperature(int value) {
    _$moonsTemperatureAtom.reportWrite(value, super.moonsTemperature, () {
      super.moonsTemperature = value;
    });
  }

  late final _$earthTemperatureAtom =
      Atom(name: '_Temperature.earthTemperature', context: context);

  @override
  int get earthTemperature {
    _$earthTemperatureAtom.reportRead();
    return super.earthTemperature;
  }

  @override
  set earthTemperature(int value) {
    _$earthTemperatureAtom.reportWrite(value, super.earthTemperature, () {
      super.earthTemperature = value;
    });
  }

  late final _$_TemperatureActionController =
      ActionController(name: '_Temperature', context: context);

  @override
  void fetchTemperatureData() {
    final _$actionInfo = _$_TemperatureActionController.startAction(
        name: '_Temperature.fetchTemperatureData');
    try {
      return super.fetchTemperatureData();
    } finally {
      _$_TemperatureActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moonsTemperature: ${moonsTemperature},
earthTemperature: ${earthTemperature}
    ''';
  }
}
