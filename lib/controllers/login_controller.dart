import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/auth_controller.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  String email = '';
  String password = '';

  AuthController _authController = Get.find();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Please insert a valid email address";
    } else
      return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    } else
      return null;
  }

  void checkLoginStatus() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      await _authController.login(email, password);
      this.clearFields();
    }
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
