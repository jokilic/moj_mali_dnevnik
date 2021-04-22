import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class NoteColorWidget extends StatelessWidget {
  final Function() onTap;
  final Color backgroundColor;
  final bool isChosen;

  const NoteColorWidget({
    required this.onTap,
    required this.backgroundColor,
    required this.isChosen,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child: PressableDough(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: <Widget>[
                /// White container
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Constants.colors.grey,
                        offset: Offset(4.w, 6.h),
                      )
                    ],
                  ),
                  height: isChosen ? 60.r : 48.r,
                  width: isChosen ? 60.r : 48.r,
                ),

                /// Offset container
                Positioned(
                  right: isChosen ? 0.w : 1.w,
                  bottom: isChosen ? 8.h : 16.h,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backgroundColor,
                    ),
                    height: isChosen ? 54.r : 42.r,
                    width: isChosen ? 54.r : 42.r,
                  ),
                ),

                /// Border container
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.colors.brown,
                    ),
                  ),
                  height: isChosen ? 60.r : 48.r,
                  width: isChosen ? 60.r : 48.r,
                ),
              ],
            ),
          ),
        ),
      );
}
