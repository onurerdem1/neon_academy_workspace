import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedPadding extends StatefulWidget {
  const ExpandedPadding({super.key});

  @override
  State<ExpandedPadding> createState() => _ExpandedPaddingState();
}

class _ExpandedPaddingState extends State<ExpandedPadding> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 100,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                color: Colors.amber,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              color: Colors.green,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.amber,
          ),
          Container(
            height: 50,
            width: 50,
            color: Colors.green,
          )
        ],
      ),
    ));
  }
}
