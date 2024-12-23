import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
        overlayColor: WidgetStateProperty.all(Colors.amber),
        unselectedLabelColor: Colors.green,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.red,
        splashBorderRadius: BorderRadius.circular(20),
        tabs: [
          Tab(
            child: Text("Smash"),
            icon: Icon(Icons.dangerous),
          ),
          Tab(
            child: Text("Jump"),
            icon: Icon(Icons.air),
          ),
          Tab(
            child: Text("Climb"),
            icon: Icon(Icons.call_made_rounded),
          ),
          Tab(
            child: Text("Run"),
            icon: Icon(Icons.run_circle),
          )
        ]);
  }
}
