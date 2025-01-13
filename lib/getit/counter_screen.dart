import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'counter_service.dart';

class CounterScreen extends StatelessWidget {
  final CounterService _counterService = GetIt.I<CounterService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetIt Counter Example'),
      ),
      body: AnimatedBuilder(
        animation: _counterService,
        builder: (context, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Count: ${_counterService.counter}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _counterService.increment,
                      child: Text('Increment'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _counterService.decrement,
                      child: Text('Decrement'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
