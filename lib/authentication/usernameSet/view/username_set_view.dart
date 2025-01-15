import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/usernameSet/viewmodel/username_set_view_model.dart';
import 'package:provider/provider.dart';

class UsernameSetView extends StatefulWidget {
  const UsernameSetView({super.key});

  @override
  State<UsernameSetView> createState() => _UsernameSetViewState();
}

class _UsernameSetViewState extends State<UsernameSetView> {
  String userValue = "";
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UsernameSetViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Set your username"),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            Container(
              width: 200,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    userValue = value;
                  });
                },
              ),
            ),
            IconButton(
                onPressed: () async {
                  await viewModel.setUsername(context, userValue);
                },
                icon: Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
