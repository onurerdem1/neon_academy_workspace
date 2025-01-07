import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neon_academy_workspace/authentication/register/viewmodel/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel = RegisterViewModel();
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign Up",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                registerViewModel.navigateToLogin(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              emailTextField(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              passwordTextField1(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              passwordTextField2(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              passwordText(),
              SizedBox(
                height: screenHeight * 0.16,
              ),
              agreeText(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              registerButton(registerViewModel),
              SizedBox(
                height: screenHeight * 0.02,
              ),
            ],
          ),
        ]));
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
        SizedBox(
          height: screenHeight * 0.01,
        ),
        SizedBox(
            width: screenWidth * 0.9,
            child: TextField(
              controller: emailController,
              cursorColor: Colors.greenAccent[200],
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail),
                  prefixIconColor: Colors.greenAccent[200],
                  hintText: "example@example.com",
                  hintStyle: TextStyle(fontFamily: "Montserrat"),
                  contentPadding: EdgeInsets.symmetric(horizontal: 24),
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

  Widget passwordTextField1() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        SizedBox(
          width: screenWidth * 0.9,
          child: TextField(
            controller: passwordController1,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                prefixIconColor: Colors.greenAccent[200],
                hintText: "Password",
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        BorderSide(color: Colors.greenAccent[200]!, width: 2))),
          ),
        )
      ],
    );
  }

  Widget passwordTextField2() {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirm Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        SizedBox(
          width: screenWidth * 0.9,
          child: TextField(
            controller: passwordController2,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                prefixIconColor: Colors.greenAccent[200],
                hintText: "Confirm Password",
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        BorderSide(color: Colors.greenAccent[200]!, width: 2))),
          ),
        )
      ],
    );
  }

  Widget agreeText() {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        width: screenWidth * 0.9,
        child: Text.rich(TextSpan(
            text:
                "By click the agree and continue button, you're agree to News App's ",
            style: TextStyle(fontSize: 13),
            children: [
              TextSpan(
                  text: "Terms and Service ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              TextSpan(
                  text: "and acknowledge the ", style: TextStyle(fontSize: 13)),
              TextSpan(
                  text: "Privacy and Policy",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
            ])));
  }

  Widget passwordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.greenAccent,
          size: 13,
        ),
        Column(
          children: [
            Text(
              "Password must be at least 8 characters,uppercase",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            Text(
              "lowercase,and unique code like #%!",
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ],
    );
  }

  Widget registerButton(RegisterViewModel viewModel) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final RegisterViewModel registerViewModel = RegisterViewModel();
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.06,
      child: FloatingActionButton(
        backgroundColor: Colors.greenAccent[200],
        onPressed: () {
          registerViewModel.navigateToLogin(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          "Agree And Continue",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }
}
