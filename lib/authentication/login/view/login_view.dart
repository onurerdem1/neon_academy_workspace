import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_academy_workspace/authentication/login/viewmodel/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = LoginViewModel();
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.17,
              ),
              buildIcon(),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              emailTextField(),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              passwordTextField(),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              loginButton(loginViewModel),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              forgotPassword(),
              SizedBox(
                height: screenHeight * 0.08,
              ),
              dontHaveAccount(loginViewModel)
            ],
          ),
        ]));
  }

  Widget buildIcon() {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Lottie.asset(
          "assets/news_icon_lottie.json",
          height: screenHeight * 0.2,
        ),
        Text(
          "Sign In",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }

  Widget emailTextField() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        SizedBox(height: screenHeight * 0.01),
        SizedBox(
            width: screenWidth * 0.9,
            child: TextFormField(
              cursorColor: Colors.blue,
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "example@example.com",
                  prefixIconColor: Colors.greenAccent[200],
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                    30.0,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          color: Colors.greenAccent[200]!, width: 2))),
            ))
      ],
    );
  }

  Widget passwordTextField() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        SizedBox(
            width: screenWidth * 0.9,
            child: TextFormField(
              cursorColor: Colors.greenAccent,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIconColor: Colors.greenAccent[200],
                  prefixIcon: Icon(Icons.password),
                  contentPadding: EdgeInsets.symmetric(horizontal: 24),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                          color: Colors.greenAccent[200]!, width: 2))),
            ))
      ],
    );
  }

  Widget loginButton(
    LoginViewModel viewModel,
  ) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.06,
      child: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          viewModel.navigatetoHome(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget forgotPassword() {
    return GestureDetector(
      child: Text(
        "Forgot Password?",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  Widget dontHaveAccount(LoginViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't Have Account?  ",
          style: TextStyle(fontFamily: "Montserrat", fontSize: 13),
        ),
        GestureDetector(
          onTap: () {
            viewModel.navigateToRegister(context);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.greenAccent),
          ),
        )
      ],
    );
  }
}
