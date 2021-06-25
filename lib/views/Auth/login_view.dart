import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yotes/views/Auth/signup_view.dart';

import '../../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _controller.loginFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Log In",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                    ),
                    onSaved: (value) {
                      _controller.email = value!;
                    },
                    validator: (value) {
                      return _controller.validateEmail(value!);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _controller.passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.password_outlined),
                      labelText: "Password",
                    ),
                    onSaved: (value) {
                      _controller.password = value!;
                    },
                    validator: (value) {
                      return _controller.validatePassword(value!);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _controller.checkLoginStatus,
                    child: Text("Login"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => SignupView());
                      _controller.clearFields();
                    },
                    child: Text("Sign Up"),
                  ),
                  Divider(
                    height: 40,
                    thickness: 2,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: _controller.facebookLoginStatus,
                    icon: Icon(Icons.facebook),
                    label: Text("Continue With Facebook"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
