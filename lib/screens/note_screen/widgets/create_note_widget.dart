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
      padding: EdgeInsets.only(top: 180.h),
      child: Column(
        children: [
          /// Title field
          TextField(
            onChanged: (value) => value.isNotEmpty
                ? _noteController.titleNotEmpty = true
                : _noteController.titleNotEmpty = false,
            controller: _noteController.titleController,
            autofocus: true,
            textInputAction: TextInputAction.next,
            style: Constants.textStyles.createNoteTitle,
            cursorWidth: 4,
            cursorColor: Constants.colors.black,
            maxLines: 2,
            inputFormatters: [LengthLimitingTextInputFormatter(36)],
            decoration: InputDecoration.collapsed(
              hintText: Constants.strings.createNoteHintTitle,
              hintStyle: Constants.textStyles.createNoteHintTitle,
            ),
          ),

          SizedBox(height: 16.h),

          /// Content field
          SizedBox(
            height: 200.h,
            child: TextField(
              controller: _noteController.contentController,
              keyboardType: TextInputType.multiline,
              style: Constants.textStyles.createNoteContent,
              cursorWidth: 4,
              cursorColor: Constants.colors.black,
              maxLines: null,
              decoration: InputDecoration.collapsed(
                hintText: Constants.strings.createNoteHintContent,
                hintStyle: Constants.textStyles.createNoteHintContent,
              ),
            ),
          ),

          Image.asset(
            _illustrationController.randomIllustration,
          ),
        ],
      ),
    );
  }
}
