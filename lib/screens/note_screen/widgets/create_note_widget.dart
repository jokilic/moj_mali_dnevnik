import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../controllers/illustration_controller.dart';
import '../../../controllers/note_controller.dart';

class CreateNoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _noteController = Get.find<NoteController>();
    final _illustrationController = Get.find<IllustrationController>();

    return Padding(
      padding: EdgeInsets.only(top: 120.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// Title field
            TextField(
              controller: _noteController.titleController,
              autofocus: true,
              textInputAction: TextInputAction.next,
              style: Constants.textStyles.createNoteTitle,
              cursorWidth: 4,
              cursorColor: Constants.colors.black,
              maxLines: 2,
              inputFormatters: [LengthLimitingTextInputFormatter(36)],
              decoration: InputDecoration.collapsed(
                hintText: 'Title',
                hintStyle: Constants.textStyles.createNoteHintTitle,
              ),
            ),

            SizedBox(height: 16.h),

            /// Content field
            TextField(
              controller: _noteController.contentController,
              keyboardType: TextInputType.multiline,
              style: Constants.textStyles.createNoteContent,
              cursorWidth: 4,
              cursorColor: Constants.colors.black,
              maxLines: 8,
              decoration: InputDecoration.collapsed(
                hintText: 'Type something...',
                hintStyle: Constants.textStyles.createNoteHintContent,
              ),
            ),

            Image.asset(
              _illustrationController.randomIllustration,
            ),
          ],
        ),
      ),
    );
  }
}
