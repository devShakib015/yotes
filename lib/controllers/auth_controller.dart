import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:yotes/models/app_user_model.dart';
import 'package:yotes/utils/constants.dart';
import 'package:yotes/utils/utils.dart';

class AuthController extends GetxController {
  Rx<User?> _currentUser = auth.currentUser.obs;

  User? get getCurrentUser => _currentUser.value;

  @override
  void onInit() {
    super.onInit();
    _currentUser.bindStream(auth.userChanges());
  }

  Future<void> login(String email, String password) async {
    try {
      showLoading();
      await auth.signInWithEmailAndPassword(email: email, password: password);
      dismissLoading();
    } catch (e) {
      dismissLoading();

      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    try {
      showLoading();
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final _uid = value.user!.uid;
        await userCollection
            .doc(_uid)
            .set(AppUser(name: name, email: email, id: _uid).toMap());
      });
      Get.back();
      dismissLoading();
    } catch (e) {
      dismissLoading();
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
