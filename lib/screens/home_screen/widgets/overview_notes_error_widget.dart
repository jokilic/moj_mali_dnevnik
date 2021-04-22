import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../controllers/illustration_controller.dart';

class OverviewNotesErrorWidget extends StatelessWidget {
  final String error;

  const OverviewNotesErrorWidget(this.error);

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
          Constants.strings.errorTitle,
          style: Constants.textStyles.errorTitle,
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ),
        SizedBox(height: 8.h),
        Text(
          error,
          style: Constants.textStyles.errorSubtitle,
          textAlign: TextAlign.center,
          textScaleFactor: 1,
        ),
      ],
    );
  }
}
