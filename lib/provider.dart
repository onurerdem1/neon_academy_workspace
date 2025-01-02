import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class ProviderView extends StatefulWidget {
  const ProviderView({super.key});

  @override
  State<ProviderView> createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder: (context, value, child) {
                return Text("Count : ${value.count}");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<Counter>().increment();
                },
                child: Text("Increment"))
          ],
        ),
      ),
    );
  }
}
