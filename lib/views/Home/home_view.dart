import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/note_controller.dart';
import 'package:yotes/views/Home/components/app_bottom_sheet.dart';
import 'package:yotes/views/Home/components/app_drawer.dart';
import 'package:yotes/views/Home/components/notes_grid_view.dart';

import '../../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final _homeController = Get.put(HomeController());
  final _noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_homeController.appName),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: _homeController.appName,
                applicationVersion: _homeController.appVersion,
                applicationLegalese: _homeController.appLegal,
              );
            },
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(
            AppBottomSheet(
              homeController: _homeController,
              noteController: _noteController,
            ),
            backgroundColor: Get.theme.canvasColor,
          );
        },
        label: Row(
          children: [
            Icon(Icons.add),
            SizedBox(
              width: 5,
            ),
            Text("Add Note")
          ],
        ),
      ),
      drawer: AppDrawer(controller: _homeController),
      body: NotesGridView(controller: _noteController),
    );
  }
}
