import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yotes/controllers/home_controller.dart';
import 'package:yotes/controllers/note_controller.dart';
import 'package:yotes/models/note_model.dart';

class AppBottomSheet extends StatelessWidget {
  AppBottomSheet({
    Key? key,
    required NoteController noteController,
    required HomeController homeController,
    this.isEdit = false,
    this.note,
  })  : _homeController = homeController,
        _noteController = noteController,
        super(key: key);

  final HomeController _homeController;
  final NoteController _noteController;
  final bool isEdit;
  final Note? note;

  @override
  Widget build(BuildContext context) {
    if (isEdit) {
      _homeController.titleEditingController.text = note!.title;
      _homeController.noteEditingController.text = note!.note;
      _homeController.title = note!.title;
      _homeController.note = note!.note;
    }
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _homeController.titleEditingController,
              onChanged: (value) {
                _homeController.title = value;
              },
              decoration: InputDecoration(
                labelText: "Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                controller: _homeController.noteEditingController,
                onChanged: (value) {
                  _homeController.note = value;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                maxLength: 5000,
                decoration: InputDecoration(
                  labelText: "Note",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: isEdit
                  ? () => _noteController.editNote(
                      noteId: note!.id, time: note!.time)
                  : _noteController.createNote,
              child: Text("Save Note"),
            )
          ],
        ),
      ),
    );
  }
}
