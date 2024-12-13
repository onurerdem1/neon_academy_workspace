import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _sliderValue = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/green_dragon.jpg")))),
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/red_dragon.png")))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Slider(
                activeColor: Colors.green,
                inactiveColor: Colors.red,
                max: 100,
                min: 0,
                label: _sliderValue.toString(),
                divisions: 4,
                thumbColor: Colors.blue,
                value: _sliderValue.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value.round();
                  });
                }),
          )
        ],
      ),
    );
  }
}
