import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/note_controller.dart';
import '../../widgets/rounded_button_widget.dart';
import 'widgets/create_note_widget.dart';
import 'widgets/edit_note_widget.dart';
import 'widgets/note_colors_widget.dart';

class NoteScreen extends StatelessWidget {
  static const id = '/note_screen';

  @override
  Widget build(BuildContext context) {
    final _noteController = Get.find<NoteController>();

    return Scaffold(
      backgroundColor: Constants.colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        constraints: BoxConstraints(
          minHeight: 1.sh,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// Main content - shown depending on state
            _noteController.obx(
              (note) => EditNoteWidget(),
              onEmpty: CreateNoteWidget(),
            ),

            /// Discard / Delete note button
            Padding(
              padding: EdgeInsets.only(top: 64.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: RoundedButtonWidget(
                  onTap: Get.back,
                  backgroundColor: Constants.colors.red,
                  icon: Icons.close,
                ),
              ),
            ),

            /// Save note button
            Padding(
              padding: EdgeInsets.only(top: 64.h),
              child: Align(
                alignment: Alignment.topRight,
                child: Obx(
                  () => RoundedButtonWidget(
                    onTap: _noteController.titleNotEmpty
                        ? () async {
                            await _noteController.saveNote();
                            Get.back();
                          }
                        : () {},
                    backgroundColor: _noteController.titleNotEmpty
                        ? Constants.colors.green
                        : Constants.colors.grey,
                    icon: Icons.check,
                  ),
                ),
              ),
            ),

            /// Note colors
            Padding(
              padding: EdgeInsets.only(bottom: 32.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: NoteColorsWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
