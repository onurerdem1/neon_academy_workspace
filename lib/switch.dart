import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  Color scaffoldColor = Colors.red;
  bool switchOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "OFF",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Switch(
            value: switchOn,
            onChanged: (value) {
              setState(() {
                switchOn = value;
                value
                    ? scaffoldColor = Colors.green
                    : scaffoldColor = Colors.red;
              });
            },
            inactiveTrackColor: Colors.green,
            activeTrackColor: Colors.red,
            thumbColor: WidgetStateProperty.all(Colors.black),
          ),
          Text(
            "ON",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
