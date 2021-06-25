import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/auth_controller.dart';
import 'package:yotes/controllers/home_controller.dart';
import 'package:yotes/utils/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Center(
              child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      auth.currentUser!.photoURL == null
                          ? Container()
                          : Container(
                              child: Image.network(auth.currentUser!.photoURL!),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${_controller.userName}',
                      ),
                      Text(
                        '${_controller.userEmail}',
                      ),
                    ],
                  )),
            ),
          ),
          Expanded(child: Container()),
          auth.currentUser!.emailVerified
              ? Container()
              : Card(
                  child: ListTile(
                    title: Text("Verify Email"),
                    leading: Icon(Icons.verified),
                    onTap: () {
                      Get.find<AuthController>().verifyEmail();
                    },
                  ),
                ),
          Card(
            child: ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.logout),
              onTap: () {
                Get.find<AuthController>().signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
