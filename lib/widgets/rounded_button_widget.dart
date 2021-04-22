import 'package:dough/dough.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class RoundedButtonWidget extends StatelessWidget {
  final Function() onTap;
  final Color backgroundColor;
  final IconData icon;
  final bool smallIcon;

  const RoundedButtonWidget({
    required this.onTap,
    required this.backgroundColor,
    required this.icon,
    this.smallIcon = false,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
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
                      offset: Offset(6.w, 8.h),
                    )
                  ],
                ),
                height: 80.r,
                width: 80.r,
              ),

              /// Offset container
              Positioned(
                right: 2.w,
                bottom: 0.h,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor,
                  ),
                  height: 72.r,
                  width: 72.r,
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
                height: 80.r,
                width: 80.r,
              ),

              /// Icon
              Icon(
                icon,
                color: Constants.colors.brown,
                size: smallIcon ? 40.r : 48.r,
              ),
            ],
          ),
        ),
      );
}
