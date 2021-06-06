import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/auth_controller.dart';
import 'package:yotes/controllers/login_controller.dart';

class SignupController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();

  late TextEditingController emailController,
      passwordController,
      nameController;

  String email = '';
  String password = '';
  String name = '';

  AuthController _authController = Get.find();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Please insert a valid email address";
    } else
      return null;
  }

  String? validateName(String value) {
    if (value.length < 3) {
      return "Name must be at least 3 characters!";
    } else
      return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    } else
      return null;
  }

  void checkSignUpStatus() async {
    if (signUpFormKey.currentState!.validate()) {
      signUpFormKey.currentState!.save();

      await _authController.signUp(email, password, name);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
