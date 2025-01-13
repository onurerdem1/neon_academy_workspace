import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/login/view/login_view.dart';

class HomeViewModel extends ChangeNotifier {
  Future<void> logoutButtonAction(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      print("sign out succesfull");
      navigateToLogin(context);
    } catch (e) {
      print(e);
    }
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 750),
      ),
    );
  }
}
