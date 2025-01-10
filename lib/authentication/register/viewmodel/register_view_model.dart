import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/login/view/login_view.dart';

class RegisterViewModel extends ChangeNotifier {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;
  bool isMatched = false;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController1 => _passwordController1;
  TextEditingController get passwordController2 => _passwordController2;

  GlobalKey<FormState> get formKey => _formKey;
  bool get isPasswordVisible1 => _isPasswordVisible1;
  bool get isPasswordVisible2 => _isPasswordVisible2;

  Future<void> registerButtonAction(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController1.text);
        print("Register Succesfull");
        await Future.delayed(const Duration(seconds: 2));
        navigateToLogin(context);
      } catch (e) {
        print(e);
      }
    }
  }

  void togglePasswordVisibility1() {
    _isPasswordVisible1 = !_isPasswordVisible1;
    notifyListeners();
  }

  void togglePasswordVisibility2() {
    _isPasswordVisible2 = !_isPasswordVisible2;
    notifyListeners();
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
