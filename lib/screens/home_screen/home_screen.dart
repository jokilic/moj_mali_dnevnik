import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/database_controller.dart';
import '../../controllers/illustration_controller.dart';
import '../../controllers/note_colors_controller.dart';
import '../../controllers/note_controller.dart';
import '../../widgets/rounded_button_widget.dart';
import '../note_screen/note_screen.dart';
import 'widgets/overview_no_notes_widget.dart';
import 'widgets/overview_notes_error_widget.dart';
import 'widgets/overview_notes_loading_widget.dart';
import 'widgets/overview_notes_widget.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home_screen';

  @override
  Widget build(BuildContext context) {
    final _databaseController =
        Get.put<DatabaseController>(DatabaseController());
    final _noteController = Get.put<NoteController>(NoteController());
    Get.put<NoteColorsController>(NoteColorsController());
    Get.put<IllustrationController>(IllustrationController());

    return Scaffold(
      backgroundColor: Constants.colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.r),
        constraints: BoxConstraints(
          minHeight: 1.sh,
        ),
        child: Stack(
          children: [
            /// Main title
            Padding(
              padding: EdgeInsets.symmetric(vertical: 88.r),
              child: Text(
                Constants.strings.title,
                style: Constants.textStyles.title,
                textScaleFactor: 1,
              ),
            ),

            /// Main content - shown depending on state
            _databaseController.obx(
              (notes) => OverviewNotesWidget(notes!),
              onEmpty: OverviewNoNotesWidget(),
              onError: (error) => OverviewNotesErrorWidget(error ?? ''),
              onLoading: OverviewNotesLoadingWidget(),
            ),

            /// Delete chosen notes button
            Obx(
              () => AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                opacity: _databaseController.chosenNotes.isNotEmpty ? 1 : 0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: RoundedButtonWidget(
                      onTap: _databaseController.chosenNotes.isNotEmpty
                          ? _databaseController.deleteChosenNotes
                          : () {},
                      backgroundColor: Constants.colors.red,
                      icon: Icons.delete,
                      smallIcon: true,
                    ),
                  ),
                ),
              ),
            ),

            /// Add note button
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Align(
                alignment: Alignment.bottomRight,
                child: RoundedButtonWidget(
                  onTap: () {
                    _databaseController.chosenNotes.clear();
                    _noteController.changeNoteState(null);
                    Get.toNamed(NoteScreen.id);
                  },
                  backgroundColor: Constants.colors.yellow,
                  icon: Icons.add,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
