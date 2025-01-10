import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:neon_academy_workspace/authentication/register/viewmodel/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
        Provider.of<RegisterViewModel>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
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
              registerForm(registerViewModel),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              passwordText(),
              const Expanded(
                child: SizedBox(),
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

  Widget registerForm(RegisterViewModel registerViewModel) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Form(
      key: registerViewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: TextFormField(
              controller: registerViewModel.emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "example@example.com",
                prefixIcon: const Icon(Icons.email),
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
          const SizedBox(height: 20),
          const Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: TextFormField(
              controller: registerViewModel.passwordController2,
              obscureText: !registerViewModel.isPasswordVisible2,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                }
                if (registerViewModel.passwordController1.text !=
                    registerViewModel.passwordController2.text) {
                  return "Password does not match";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(Icons.password),
                suffixIcon: GestureDetector(
                  onTap: () {
                    registerViewModel.togglePasswordVisibility2();
                  },
                  child: Icon(registerViewModel.isPasswordVisible2
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
          const SizedBox(height: 20),
          const Text(
            "Confirm Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(
            width: screenWidth * 0.9,
            child: TextFormField(
              controller: registerViewModel.passwordController1,
              obscureText: !registerViewModel.isPasswordVisible1,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                }
                if (registerViewModel.passwordController1.text !=
                    registerViewModel.passwordController2.text) {
                  return "Password does not match";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Confirm Password",
                prefixIcon: const Icon(Icons.password),
                suffixIcon: GestureDetector(
                  onTap: () {
                    registerViewModel.togglePasswordVisibility1();
                  },
                  child: Icon(registerViewModel.isPasswordVisible1
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

  Widget agreeText() {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
        width: screenWidth * 0.9,
        child: const Text.rich(const TextSpan(
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
    return const Row(
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

  Widget registerButton(RegisterViewModel registerViewModel) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.06,
      child: FloatingActionButton(
        backgroundColor: Colors.greenAccent[200],
        onPressed: () {
          registerViewModel.registerButtonAction(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Text(
          "Agree And Continue",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }
}
