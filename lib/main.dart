import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:neon_academy_workspace/admob.dart';
import 'package:neon_academy_workspace/buttons.dart';
import 'package:neon_academy_workspace/comedy_club_challange.dart';
import 'package:neon_academy_workspace/container_workspace.dart';
import 'package:neon_academy_workspace/data_table.dart';
import 'package:neon_academy_workspace/expanded_padding.dart';
import 'package:neon_academy_workspace/flexible_class.dart';
import 'package:neon_academy_workspace/futuretech_challange.dart';
import 'package:neon_academy_workspace/grid_view.dart';
import 'package:neon_academy_workspace/hero.dart';
import 'package:neon_academy_workspace/linear_progress.dart';
import 'package:neon_academy_workspace/list_view.dart';
import 'package:neon_academy_workspace/lottie.dart';
import 'package:neon_academy_workspace/notification_center.dart';
import 'package:neon_academy_workspace/picker.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomePageAds(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
