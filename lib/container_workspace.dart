import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  String text = "Hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            text == "Hello" ? text = "Merhaba" : text = "Hello";
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 5)),
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          margin: EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow,
                border: Border.all(color: Colors.black, width: 5)),
            child: Text(
              text,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
