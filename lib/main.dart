import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/buttons.dart';
import 'package:neon_academy_workspace/container_workspace.dart';
import 'package:neon_academy_workspace/flexible_class.dart';
import 'package:neon_academy_workspace/list_view.dart';
import 'package:neon_academy_workspace/shared_preferences.dart';
import 'package:neon_academy_workspace/sliders.dart';
import 'package:neon_academy_workspace/textfields.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: FlexibleClass(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
