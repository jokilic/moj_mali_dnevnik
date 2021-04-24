import 'package:get/get.dart';

import 'database_controller.dart';

class LayoutController extends GetxController {
  /// ------------------------
  /// METHODS
  /// ------------------------

  double calculateTileHeight(int index) {
    final notes = Get.find<DatabaseController>().notes;
    final note = notes[index];

    if (note.content.isEmpty) {
      return 1.5;
    }
    if (note.content.length < 30) {
      return 2;
    }
    if (note.content.length >= 30 && note.content.length < 60) {
      return 3;
    }
    if (note.content.length >= 60) {
      return 3.5;
    }
    return 2.5;
  }

  int calculateMaxLines(int index) {
    final notes = Get.find<DatabaseController>().notes;
    final note = notes[index];

    if (note.content.length < 60) {
      return 4;
    }
    if (note.content.length >= 60) {
      return 8;
    }
    return 4;
  }
}
