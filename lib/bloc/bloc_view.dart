import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_academy_workspace/bloc/counter_bloc.dart';
import 'package:neon_academy_workspace/bloc/counter_event.dart';
import 'package:neon_academy_workspace/bloc/counter_state.dart';
import 'package:path/path.dart';

class BlocView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
        body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count : ${state.count}"),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterIncrementPressed());
              },
              child: Text("Increment"),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(CounterDecrementPressed());
              },
              child: Text("Decrement"),
            )
          ],
        ),
      );
    }));
  }
}
