import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/home/view/home_view.dart';
import 'package:neon_academy_workspace/authentication/register/view/register_view.dart';

class LoginViewModel extends ChangeNotifier {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isPasswordVisible = false;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isPasswordVisible => _isPasswordVisible;

  LoginViewModel() {
    _init();
  }

  Future<void> _init() async {}

  Future<void> loginButtonAction(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        print("Login Succesfull");
        navigatetoHome(context);
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login Unsuccesfull")));
      }
    }
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
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

  void navigateToRegister(BuildContext context) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const RegisterScreen(),
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
            transitionDuration: const Duration(milliseconds: 750)));
  }
}
