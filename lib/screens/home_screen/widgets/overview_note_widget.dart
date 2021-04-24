import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../controllers/database_controller.dart';
import '../../../controllers/layout_controller.dart';
import '../../../controllers/note_colors_controller.dart';
import '../../../controllers/note_controller.dart';
import '../../../models/note.dart';
import '../../note_screen/note_screen.dart';

class OverviewNoteWidget extends StatelessWidget {
  final Note note;
  final int index;

  const OverviewNoteWidget({
    required this.note,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final _databaseController = Get.find<DatabaseController>();
    final _layoutController = Get.find<LayoutController>();
    final _noteController = Get.find<NoteController>();
    final _noteColorsController = Get.find<NoteColorsController>();

    return GestureDetector(
      onTap: () {
        _databaseController.chosenNotes.clear();
        _noteController.changeNoteState(note);
        Get.toNamed(NoteScreen.id);
      },
      onLongPress: () => _databaseController.toggleChosenNote(note),
      behavior: HitTestBehavior.translucent,
      child: PressableDough(
        child: Obx(
          () => Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: _databaseController.chosenNotes.contains(note)
                    ? Constants.colors.black
                    : _noteColorsController.noteColors[note.color].color,
                width: 6,
              ),
              borderRadius: BorderRadius.circular(16.r),
              color: _noteColorsController.noteColors[note.color].color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: Constants.textStyles.notesTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 1,
                ),
                SizedBox(height: 8.h),
                Text(
                  note.content,
                  style: Constants.textStyles.notesContent,
                  overflow: TextOverflow.ellipsis,
                  maxLines: _layoutController.calculateMaxLines(index),
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
