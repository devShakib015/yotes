import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/auth_controller.dart';
import 'package:yotes/views/Home/home_view.dart';
import 'package:yotes/views/Auth/login_view.dart';

class Root extends GetWidget<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.getCurrentUser == null ? LoginView() : HomeView(),
    );
  }
}
