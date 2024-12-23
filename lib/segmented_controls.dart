import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentedControlsWidget extends StatefulWidget {
  const SegmentedControlsWidget({super.key});

  @override
  State<SegmentedControlsWidget> createState() =>
      _SegmentedControlsWidgetState();
}

class _SegmentedControlsWidgetState extends State<SegmentedControlsWidget> {
  int segmentedControl = 0;
  double textsize1 = 10;
  double textsize2 = 10;
  double textsize3 = 10;
  double width = 700;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 400,
      child: CupertinoSegmentedControl<int>(
          unselectedColor: Colors.amber,
          borderColor: Colors.white,
          children: {
            0: Text(
              "Neon Academy 2023",
              style: TextStyle(fontSize: textsize1, color: Colors.amber),
            ),
            1: Text(
              "Neon",
              style: TextStyle(fontSize: textsize2),
            ),
            2: Text(
              "Apps",
              style: TextStyle(fontSize: textsize3),
            )
          },
          groupValue: segmentedControl,
          onValueChanged: (value) {
            setState(() {
              segmentedControl = value;
              if (value == 0) {
                width = 500;
              } else if (value == 1) {
                width = 350;
              } else {
                width = 300;
              }
            });
          }),
    );
  }
}
