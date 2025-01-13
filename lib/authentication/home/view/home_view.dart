import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  homeViewModel.navigateToLogin(context);
                },
                icon: const Icon(Icons.power_settings_new)),
          ]),
    );
  }
}
