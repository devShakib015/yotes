import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/auth_controller.dart';
import 'package:yotes/controllers/home_controller.dart';

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
          Card(
            child: ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.logout),
              onTap: () {
                Get.find<AuthController>().signOut();
              },
            ),
          )
        ],
      ),
    );
  }
}
