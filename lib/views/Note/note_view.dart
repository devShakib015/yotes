import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/controllers/home_controller.dart';
import 'package:yotes/controllers/note_controller.dart';
import 'package:yotes/views/Home/components/app_bottom_sheet.dart';

class NoteView extends StatelessWidget {
  final int index;
  NoteView({
    Key? key,
    required this.index,
  }) : super(key: key);

  final _noteController = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => _noteController.notes.isEmpty
            ? Text("")
            : Text(_noteController.notes[index].title)),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                AppBottomSheet(
                  noteController: _noteController,
                  homeController: Get.find<HomeController>(),
                  isEdit: true,
                  note: _noteController.notes[index],
                ),
                backgroundColor: Get.theme.canvasColor,
              );
            },
            icon: Icon(Icons.edit),
            tooltip: "Edit",
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => _noteController.notes.isEmpty
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: SelectableText(
                          _noteController.notes[index].note,
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Note Created At - ${_noteController.notes[index].time.toString().substring(0, 16)}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[900]),
                    ),
                    onPressed: () => _noteController
                        .deleteNote(_noteController.notes[index].id),
                    child: Text("Delete Note"),
                  )
                ],
              )),
      ),
    );
  }
}
