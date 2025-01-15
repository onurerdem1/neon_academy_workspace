import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/forgotPassword/viewmodel/forgot_password_view_model.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    ForgotPasswordViewModel forgotPasswordViewModel =
        Provider.of<ForgotPasswordViewModel>(context);
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                forgotPasswordViewModel.navigateToLogin(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text("Reset Password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.3,
              ),
              loginForm(forgotPasswordViewModel),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              loginButton(forgotPasswordViewModel),
              SizedBox(
                height: screenHeight * 0.02,
              ),
            ],
          ),
        ));
  }

  Widget loginForm(ForgotPasswordViewModel loginViewModel) {
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
        ],
      ),
    );
  }

  Widget loginButton(
    ForgotPasswordViewModel viewModel,
  ) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.06,
      child: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          viewModel.resetPassword(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Text(
          "Send Reset Email",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
