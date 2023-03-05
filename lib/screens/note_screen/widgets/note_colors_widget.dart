import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/note_colors_controller.dart';
import '../../../widgets/note_color_widget.dart';

class NoteColorsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _noteColorsController = Get.put<NoteColorsController>(NoteColorsController());

    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _noteColorsController.noteColors.length,
        itemBuilder: (context, index) {
          final noteColor = _noteColorsController.noteColors[index];

          return Obx(
            () => NoteColorWidget(
              onTap: () => _noteColorsController.chosenColor = noteColor,
              backgroundColor: noteColor.color,
              isChosen: _noteColorsController.chosenColor == noteColor,
            ),
          );
        },
      ),
    );
  }
}
