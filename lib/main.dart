import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:neon_academy_workspace/hive/hive.dart';
import 'package:neon_academy_workspace/hive/task.dart';
import 'package:neon_academy_workspace/screen_animations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>("tasksbox");
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TaskHomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
