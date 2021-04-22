import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class TextStyles {
  /// --------------------
  /// TITLE
  /// --------------------

  final title = TextStyle(
    fontSize: 38.sp,
    color: Constants.colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    height: 1.2,
  );

  /// --------------------
  /// NOTES
  /// --------------------

  final notesTitle = TextStyle(
    fontSize: 30.sp,
    color: Constants.colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    height: 1.2,
  );

  final notesContent = TextStyle(
    fontSize: 20.sp,
    color: Constants.colors.white,
    fontFamily: Constants.assets.poppinsFont,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );

  /// --------------------
  /// NO NOTES
  /// --------------------

  final noNotesTitle = TextStyle(
    fontSize: 36.sp,
    color: Constants.colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    height: 1.2,
  );

  final noNotesSubtitle = TextStyle(
    fontSize: 22.sp,
    color: Constants.colors.black,
    height: 1.2,
  );

  /// --------------------
  /// ERROR
  /// --------------------

  final errorTitle = TextStyle(
    fontSize: 36.sp,
    color: Constants.colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    height: 1.2,
  );

  final errorSubtitle = TextStyle(
    fontSize: 16.sp,
    color: Constants.colors.black,
    height: 1.2,
  );

  /// --------------------
  /// LOADING
  /// --------------------

  final loadingTitle = TextStyle(
    fontSize: 36.sp,
    color: Constants.colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    height: 1.2,
  );

  final loadingSubtitle = TextStyle(
    fontSize: 16.sp,
    color: Constants.colors.black,
    height: 1.2,
  );

  /// --------------------
  /// CREATE NOTE
  /// --------------------

  final createNoteTitle = TextStyle(
    fontSize: 32.sp,
    color: Constants.colors.black,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    height: 1.2,
  );

  final createNoteHintTitle = TextStyle(
    fontSize: 32.sp,
    color: Constants.colors.black.withOpacity(0.4),
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    height: 1.2,
  );

  final createNoteContent = TextStyle(
    fontSize: 24.sp,
    fontFamily: Constants.assets.poppinsFont,
    fontWeight: FontWeight.w500,
    color: Constants.colors.black,
  );

  final createNoteHintContent = TextStyle(
    fontSize: 24.sp,
    fontFamily: Constants.assets.poppinsFont,
    fontWeight: FontWeight.w500,
    color: Constants.colors.black.withOpacity(0.4),
  );
}
