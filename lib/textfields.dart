import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width: 200,
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                // onEditingComplete: () {
                // Focus.of(context).unfocus();
                //},
                decoration: InputDecoration(
                    hintText: "Enter Name-Surname",
                    hintStyle: TextStyle(color: Colors.red)),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              child: TextField(
                onSubmitted: (value) {
                  if (!value.contains("@") || !value.contains(".com")) {
                    _showError(context);
                  }
                },
                decoration: InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: Colors.blue)),
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.blue),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              child: TextField(
                maxLength: 10,
                decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    hintStyle: TextStyle(color: Colors.green)),
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.green),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showError(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Enter valid email")));
  }
}
