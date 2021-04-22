import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../controllers/illustration_controller.dart';

class OverviewNotesLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _illustrationController = Get.find<IllustrationController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          _illustrationController.randomIllustration,
        ),
        SizedBox(height: 4.h),
        Text(
          Constants.strings.noNotesTitle,
          style: Constants.textStyles.noNotesTitle,
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ),
        SizedBox(height: 8.h),
        Text(
          Constants.strings.noNotesSubtitle,
          style: Constants.textStyles.noNotesSubtitle,
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ),
      ],
    );
  }
}
