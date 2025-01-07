import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_academy_workspace/bloc/bloc_view.dart';
import 'package:neon_academy_workspace/bloc/counter_bloc.dart';
import 'package:neon_academy_workspace/lottie.dart';
import 'package:neon_academy_workspace/stepper.dart';

void main() async {
  runApp(
    MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StepperApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
