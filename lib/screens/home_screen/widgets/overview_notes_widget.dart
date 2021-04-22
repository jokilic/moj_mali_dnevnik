import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../controllers/database_controller.dart';
import '../../../controllers/illustration_controller.dart';
import '../../../controllers/layout_controller.dart';
import '../../../models/note.dart';
import 'overview_note_widget.dart';

class OverviewNotesWidget extends StatelessWidget {
  final List<Note> notes;

  const OverviewNotesWidget(this.notes);

  @override
  Widget build(BuildContext context) {
    final _databaseController = Get.find<DatabaseController>();
    final _illustrationController = Get.find<IllustrationController>();
    final _layoutController = Get.put<LayoutController>(LayoutController());

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
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: _databaseController.notes.length,
            itemBuilder: (context, index) {
              final note = _databaseController.notes[index];

              return OverviewNoteWidget(
                note: note,
                index: index,
              );
            },
            staggeredTileBuilder: (index) => StaggeredTile.count(
              2,
              _layoutController.calculateTileHeight(index),
            ),
            mainAxisSpacing: 24.r,
            crossAxisSpacing: 24.r,
          ),
        ),
      ],
    );
  }
}
