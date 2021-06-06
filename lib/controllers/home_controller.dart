import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/auth_controller.dart';
import 'package:yotes/models/app_user_model.dart';
import 'package:yotes/utils/constants.dart';

class HomeController extends GetxController {
  //Varianles

  String title = '';
  String note = '';

  //Late Variables

  late TextEditingController titleEditingController;
  late TextEditingController noteEditingController;

  //Observables

  Rx<AppUser> _user = AppUser(email: "", id: "", name: "").obs;

  //Getters

  String get userName => _user.value.name;
  String get userEmail => _user.value.email;
  String get userID => _user.value.id;

  String get appName => "YoTes";
  String get appVersion => "1.0.2";
  String get appLegal => "devShakib";

  @override
  void onInit() {
    _user.bindStream(
      userCollection
          .doc(Get.find<AuthController>().getCurrentUser!.uid)
          .snapshots()
          .map((event) {
        var _user = AppUser.fromMap(event.data()!);
        return _user;
      }),
    );

    titleEditingController = TextEditingController();
    noteEditingController = TextEditingController();

    super.onInit();
  }

  void clearFields() {
    titleEditingController.clear();
    noteEditingController.clear();
    title = '';
    note = '';
  }

  @override
  void onClose() {
    titleEditingController.dispose();
    noteEditingController.dispose();
    super.onClose();
  }
}
