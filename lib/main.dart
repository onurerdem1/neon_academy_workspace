import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:neon_academy_workspace/dio/dio_view.dart';

void main() async {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MelodyMakerApp(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
