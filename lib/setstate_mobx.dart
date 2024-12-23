import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetstateMobx extends StatefulWidget {
  const SetstateMobx({super.key});

  @override
  State<SetstateMobx> createState() => _SetstateMobxState();
}

class _SetstateMobxState extends State<SetstateMobx> {
  final Random random = Random();

  int moonsTemperature = -20;
  int earthTemperature = 15;

  void fetchTemperatureData() {
    setState(() {
      moonsTemperature = random.nextInt(60) - 50;
      earthTemperature = random.nextInt(30) - 10;
    });
  }

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
              child: Container(
                height: 165,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: Image.asset("assets/moon.jpg").image,
                        fit: BoxFit.cover)),
                child: Center(
                    child: Text(
                  "Moons temperature: $moonsTemperature",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Expanded(
              child: Container(
                height: 175,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: Image.asset("assets/earth.jpg").image,
                        fit: BoxFit.cover)),
                child: Center(
                    child: Text(
                  "Earths temperature: $earthTemperature",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
        ElevatedButton(
            onPressed: () {
              fetchTemperatureData();
            },
            child: Text("Fetch Temperature Data")),
      ],
    );
  }
}
