import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/note.dart';
import 'database_controller.dart';
import 'note_colors_controller.dart';

class NoteController extends GetxController with StateMixin<Note> {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final RxBool _titleNotEmpty = false.obs;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get titleNotEmpty => _titleNotEmpty.value;
  TextEditingController get titleController => _titleController;
  TextEditingController get contentController => _contentController;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set titleNotEmpty(bool value) => _titleNotEmpty.value = value;

  /// ------------------------
  /// METHODS
  /// ------------------------

  void changeNoteState(Note? note) {
    if (note == null) {
      clearNoteValues();
      change(null, status: RxStatus.empty());
    } else {
      setNoteValues(note);
      change(note, status: RxStatus.success());
    }
  }

  void clearNoteValues() {
    titleNotEmpty = false;
    titleController.clear();
    contentController.clear();
  }

  void setNoteValues(Note note) {
    final _noteColorsController = Get.find<NoteColorsController>();
    titleNotEmpty = true;
    titleController.text = note.title;
    contentController.text = note.content;
    _noteColorsController.chosenColor =
        _noteColorsController.noteColors[note.color];
  }

  Future<void> saveNote() async {
    final _databaseController = Get.find<DatabaseController>();
    final _noteColorsController = Get.find<NoteColorsController>();
    final noteCreated = status.isEmpty;
    final noteEdited = status.isSuccess;
    final note = Note(
      title: titleController.text,
      content: contentController.text,
      color: _noteColorsController.chosenColor.index,
      date: DateTime.now(),
      id: noteEdited ? state!.id : null,
    );

    if (noteCreated) {
      await _databaseController.insertNote(note: note);
    }
    if (noteEdited) {
      await _databaseController.updateNote(note: note);
    }
  }
}
