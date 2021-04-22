import 'package:get/get.dart';

import '../constants/constants.dart';

class IllustrationController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final RxList<String> _illustrations = <String>[
    Constants.assets.illustration1,
    Constants.assets.illustration2,
    Constants.assets.illustration3,
    Constants.assets.illustration4,
    Constants.assets.illustration5,
    Constants.assets.illustration6,
    Constants.assets.illustration7,
    Constants.assets.illustration8,
    Constants.assets.illustration9,
  ].obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  List<String> get illustrations => _illustrations;

  /// ------------------------
  /// METHODS
  /// ------------------------

  String get randomIllustration => (illustrations..shuffle()).first;
}
