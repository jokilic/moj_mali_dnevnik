import 'package:get/get.dart';

import 'screens.dart';

final pages = [
  // Home Screen
  GetPage(name: HomeScreen.id, page: () => HomeScreen()),
  // Note Screen
  GetPage(name: NoteScreen.id, page: () => NoteScreen()),
];
