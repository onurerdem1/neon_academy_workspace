import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/buttons.dart';
import 'package:neon_academy_workspace/container_workspace.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ButtonWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
