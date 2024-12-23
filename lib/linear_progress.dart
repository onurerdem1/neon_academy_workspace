import 'package:flutter/material.dart';

class LinearProgress extends StatefulWidget {
  const LinearProgress({super.key});

  @override
  State<LinearProgress> createState() => _LinearProgressState();
}

class _LinearProgressState extends State<LinearProgress> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: LinearProgressIndicator(
              backgroundColor: Colors.blue,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("$value"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (value < 10) {
                    value++;
                  } else {
                    value = 0;
                  }
                });
              },
              child: Text("Complete a task"))
        ],
      ),
    );
  }
}
