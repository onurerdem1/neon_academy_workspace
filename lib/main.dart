import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/buttons.dart';
import 'package:neon_academy_workspace/container_workspace.dart';
import 'package:neon_academy_workspace/expanded_padding.dart';
import 'package:neon_academy_workspace/flexible_class.dart';
import 'package:neon_academy_workspace/futuretech_challange.dart';
import 'package:neon_academy_workspace/grid_view.dart';
import 'package:neon_academy_workspace/linear_progress.dart';
import 'package:neon_academy_workspace/list_view.dart';
import 'package:neon_academy_workspace/scroll_view.dart';
import 'package:neon_academy_workspace/search_bar.dart';
import 'package:neon_academy_workspace/segmented_controls.dart';
import 'package:neon_academy_workspace/setstate_mobx.dart';
import 'package:neon_academy_workspace/shared_preferences.dart';
import 'package:neon_academy_workspace/sliders.dart';
import 'package:neon_academy_workspace/stack_view.dart';
import 'package:neon_academy_workspace/tabbar.dart';
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
        body: SetstateMobx(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
