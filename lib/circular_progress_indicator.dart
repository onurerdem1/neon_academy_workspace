import 'dart:async';

import 'package:flutter/material.dart';

class CircularProgressIndicatorWidget extends StatefulWidget {
  const CircularProgressIndicatorWidget({super.key});

  @override
  State<CircularProgressIndicatorWidget> createState() =>
      _CircularProgressIndicatorWidgetState();
}

class _CircularProgressIndicatorWidgetState
    extends State<CircularProgressIndicatorWidget> {
  int value = 0;
  late Timer timer;
  Color color = Colors.blue;

  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (value < 100) {
          value++;
          if (value % 10 == 0) {
            color = _getRandomColor(value ~/ 10);
          }
        } else
          timer.cancel();
      });
    });
  }

  Color _getRandomColor(int step) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];
    return colors[step % colors.length];
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            value != 100
                ? CircularProgressIndicator(color: color)
                : Container(),
            Text("$value")
          ],
        ),
      ),
    );
  }
}
