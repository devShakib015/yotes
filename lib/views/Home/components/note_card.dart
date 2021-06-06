import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yotes/models/note_model.dart';
import 'package:yotes/views/Note/note_view.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;
  const NoteCard({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => NoteView(
              index: index,
            ),
          );
        },
        child: Card(
          child: GridTile(
            header: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                note.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            footer: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  note.time.toString().substring(0, 16),
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 40,
                bottom: 24,
              ),
              child: Text(
                note.note,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
