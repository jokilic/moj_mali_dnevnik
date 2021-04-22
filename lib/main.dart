import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/constants.dart';
import 'pages.dart';
import 'screens.dart';

void main() => runApp(MojMaliDnevnik());

class MojMaliDnevnik extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: () => GetMaterialApp(
          defaultTransition: Transition.fade,
          title: Constants.assets.appName,
          theme: ThemeData(
            fontFamily: Constants.assets.breeSerifFont,
          ),
          initialRoute: HomeScreen.id,
          getPages: pages,
        ),
      );
}
