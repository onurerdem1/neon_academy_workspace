import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_academy_workspace/authentication/login/viewmodel/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.10,
              ),
              buildIcon(),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              loginForm(loginViewModel),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              loginButton(loginViewModel),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              forgotPassword(),
              const Expanded(
                child: SizedBox(),
              ),
              dontHaveAccount(loginViewModel),
              SizedBox(
                height: screenHeight * 0.07,
              ),
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

  Widget loginForm(LoginViewModel loginViewModel) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: loginViewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: TextFormField(
              controller: loginViewModel.emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "example@example.com",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      BorderSide(color: Colors.greenAccent[200]!, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: TextFormField(
              controller: loginViewModel.passwordController,
              obscureText: !loginViewModel.isPasswordVisible,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.password),
                suffixIcon: GestureDetector(
                  onTap: () {
                    loginViewModel.togglePasswordVisibility();
                  },
                  child: Icon(loginViewModel.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      BorderSide(color: Colors.greenAccent[200]!, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
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
          viewModel.loginButtonAction(context);
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
