import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoading() async {
  await Get.bottomSheet(
    Center(child: CircularProgressIndicator()),
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    ignoreSafeArea: false,
  );
}

void dismissLoading() {
  Get.back();
}
