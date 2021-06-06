import 'package:get/get.dart';
import 'package:yotes/controllers/auth_controller.dart';
import 'package:yotes/controllers/home_controller.dart';
import 'package:yotes/models/note_model.dart';
import 'package:yotes/utils/constants.dart';

class NoteController extends GetxController {
  HomeController _homeController = Get.find<HomeController>();

  //Final Variables

  final _currentUserUID = Get.find<AuthController>().getCurrentUser!.uid;
  final _noteCollection = "notes";

  //Observables

  Rx<List<Note>> _notes = Rx<List<Note>>([]);

  //Getters

  List<Note> get notes => _notes.value;

  @override
  void onInit() {
    _notes.bindStream(
      userCollection
          .doc(_currentUserUID)
          .collection(_noteCollection)
          .orderBy("time")
          .snapshots()
          .map((event) {
        List<Note> _notes = [];
        event.docs.forEach((element) {
          _notes.add(Note.fromMap(element.data()));
        });
        return _notes.reversed.toList();
      }),
    );

    super.onInit();
  }

  void createNote() async {
    if (_homeController.title.isEmpty || _homeController.note.isEmpty) {
      Get.snackbar("No Note", "The note was empty");
    } else {
      String _id = DateTime.now().millisecondsSinceEpoch.toString();
      Get.back();

      await userCollection
          .doc(_currentUserUID)
          .collection(_noteCollection)
          .doc(_id)
          .set(
            Note(
              title: _homeController.title,
              note: _homeController.note,
              time: DateTime.now(),
              id: _id,
            ).toMap(),
          );
      _homeController.clearFields();
    }
  }

  void deleteNote(String noteId) async {
    await Get.defaultDialog(
      title: "Confirmation",
      middleText: "Are you sure to delete this note?",
      textConfirm: "Yes",
      radius: 10,
      onCancel: () {},
      onConfirm: () async {
        Get.back();
        Get.back();
        await userCollection
            .doc(_currentUserUID)
            .collection(_noteCollection)
            .doc(noteId)
            .delete();
      },
    );
  }

  void editNote({required String noteId, required DateTime time}) async {
    Get.back();
    await userCollection
        .doc(_currentUserUID)
        .collection(_noteCollection)
        .doc(noteId)
        .update(Note(
                title: _homeController.title,
                note: _homeController.note,
                time: time,
                id: noteId)
            .toMap());
    _homeController.clearFields();
  }
}
