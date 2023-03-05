import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../controllers/database_controller.dart';
import '../../../controllers/illustration_controller.dart';
import '../../../models/note.dart';
import 'overview_note_widget.dart';

class OverviewNotesWidget extends StatelessWidget {
  final List<Note> notes;

  const OverviewNotesWidget(this.notes);

  @override
  Widget build(BuildContext context) {
    final _databaseController = Get.find<DatabaseController>();
    final _illustrationController = Get.find<IllustrationController>();

    return Stack(
      alignment: Alignment.center,
      children: [
        if (_databaseController.notes.length < 3)
          Padding(
            padding: EdgeInsets.only(bottom: 120.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                _illustrationController.randomIllustration,
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: 136.h),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 24.r,
            crossAxisSpacing: 24.r,
            itemCount: _databaseController.notes.length,
            itemBuilder: (context, index) {
              final note = _databaseController.notes[index];

              return OverviewNoteWidget(
                note: note,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
