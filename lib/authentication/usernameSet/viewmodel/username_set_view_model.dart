import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/home/view/home_view.dart';

class UsernameSetViewModel extends ChangeNotifier {
  Future<void> setUsername(BuildContext context, String userName) async {
    var user = await FirebaseAuth.instance.currentUser;
    if (userName != "" || userName.isNotEmpty) {
      await user!.updateDisplayName(userName);
      print("username srtted");
      print(user.displayName);
      navigatetoHome(context);
    } else {
      print("username set failed");
    }
  }

  void navigatetoHome(BuildContext context) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 750)));
  }
}
