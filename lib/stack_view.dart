import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackView extends StatefulWidget {
  const StackView({super.key});

  @override
  State<StackView> createState() => _StackViewState();
}

class _StackViewState extends State<StackView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 400,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(top: 20, child: Label(text: "Expelliarmus")),
            Positioned(
                top: 80,
                left: 20,
                child: Label(
                  text: "Lumos",
                )),
            Positioned(
                top: 140,
                right: 20,
                child: Label(
                  text: "Accio",
                )),
            Positioned(
                top: 200,
                left: 50,
                child: Label(
                  text: "Anapneo",
                ))
          ],
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String text;

  const Label({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.purpleAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
