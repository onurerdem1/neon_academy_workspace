import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollViewWidget extends StatefulWidget {
  const ScrollViewWidget({super.key});

  @override
  State<ScrollViewWidget> createState() => _ScrollViewWidgetState();
}

class _ScrollViewWidgetState extends State<ScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120, top: 200, right: 120),
      child: Container(
        height: 345,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
              9,
              (index) => index == 8
                  ? Text("You have reached the end of the scroll view!")
                  : Container(
                      width: 300,
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(25),
                      color: Colors.blueAccent,
                      child: Text(
                        'Spell ${index + 1}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
