import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/buttons.dart';
import 'package:neon_academy_workspace/container_workspace.dart';
import 'package:neon_academy_workspace/list_view.dart';
import 'package:neon_academy_workspace/sliders.dart';
import 'package:neon_academy_workspace/textfields.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ListViewWidget(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
