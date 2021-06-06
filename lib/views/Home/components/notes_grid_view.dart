import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yotes/controllers/note_controller.dart';
import 'package:yotes/views/Home/components/note_card.dart';

class NotesGridView extends StatelessWidget {
  const NotesGridView({
    Key? key,
    required NoteController controller,
  })  : _controller = controller,
        super(key: key);

  final NoteController _controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.notes.isEmpty
          ? Center(
              child: Text("Add Some Notes"),
            )
          : Container(
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                children: _controller.notes
                    .map(
                      (note) => NoteCard(
                        note: note,
                        index: _controller.notes.indexOf(note),
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }
}
