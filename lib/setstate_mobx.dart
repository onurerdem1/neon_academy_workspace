import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/models/temperature.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SetstateMobx extends StatefulWidget {
  const SetstateMobx({super.key});

  @override
  State<SetstateMobx> createState() => _SetstateMobxState();
}

class _SetstateMobxState extends State<SetstateMobx> {
  final Temperature temperature = Temperature();
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Security App"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Observer(
                builder: (_) => Container(
                  height: 165,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: Image.asset("assets/moon.jpg").image,
                          fit: BoxFit.cover)),
                  child: Center(
                      child: Text(
                    "Moons temperature: ${temperature.moonsTemperature}",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => Container(
                  height: 175,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: Image.asset("assets/earth.jpg").image,
                          fit: BoxFit.cover)),
                  child: Center(
                      child: Text(
                    "Earths temperature: ${temperature.earthTemperature}",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            )
          ],
        ),
        ElevatedButton(
            onPressed: () {
              temperature.fetchTemperatureData();
            },
            child: Text("Fetch Temperature Data")),
      ],
    );
  }
}
