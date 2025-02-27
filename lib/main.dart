import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/comment/viewmodel/comment_view_model.dart';
import 'package:neon_academy_workspace/authentication/forgotPassword/viewmodel/forgot_password_view_model.dart';
import 'package:neon_academy_workspace/authentication/home/viewmodel/home_view_model.dart';
import 'package:neon_academy_workspace/authentication/login/view/login_view.dart';
import 'package:neon_academy_workspace/authentication/login/viewmodel/login_view_model.dart';
import 'package:neon_academy_workspace/authentication/register/viewmodel/register_view_model.dart';
import 'package:neon_academy_workspace/authentication/usernameSet/viewmodel/username_set_view_model.dart';
import 'package:neon_academy_workspace/firebase_options.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RegisterViewModel()),
      ChangeNotifierProvider(create: (context) => ForgotPasswordViewModel()),
      ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ChangeNotifierProvider(create: (context) => CommentViewModel()),
      ChangeNotifierProvider(create: (context) => UsernameSetViewModel())
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
