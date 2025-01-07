import 'package:flutter/material.dart';

class StepperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepperScreen(),
    );
  }
}

class StepperScreen extends StatefulWidget {
  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentValue = 0;
  final int _minValue = 0;
  final int _maxValue = 50;
  final int _step = 5;

  int _currentStep = 0;

  void _increment() {
    if (_currentValue + _step <= _maxValue) {
      setState(() {
        _currentValue += _step;
      });
    }
  }

  void _decrement() {
    if (_currentValue - _step >= _minValue) {
      setState(() {
        _currentValue -= _step;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sarah\'s Stepper'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              thickness: 4,
              color: Colors.blueAccent,
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(height: 20),
            Text(
              'Value: $_currentValue',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Container(
              color: Colors.pink[200],
              child: Stepper(
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentValue + _step <= _maxValue) {
                    _increment();
                    setState(() {
                      _currentStep =
                          (_currentStep + 1).clamp(0, _maxValue ~/ _step);
                    });
                  }
                },
                onStepCancel: () {
                  if (_currentValue - _step >= _minValue) {
                    _decrement();
                    setState(() {
                      _currentStep =
                          (_currentStep - 1).clamp(0, _maxValue ~/ _step);
                    });
                  }
                },
                steps: List.generate(
                  (_maxValue ~/ _step) + 1,
                  (index) => Step(
                    title: Text('Step ${index * _step}'),
                    content: Text('Value: ${index * _step}'),
                    isActive: _currentStep == index,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrement,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/decrement_doll.png',
                        height: 50,
                        width: 50,
                      ),
                      Icon(Icons.favorite, color: Colors.pinkAccent, size: 20),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _increment,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    shape: CircleBorder(),
                    backgroundColor: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/increment_doll.png',
                        height: 50,
                        width: 50,
                      ),
                      Icon(Icons.favorite, color: Colors.pinkAccent, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
