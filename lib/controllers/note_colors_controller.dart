import 'package:get/get.dart';

import '../constants/constants.dart';
import '../models/note_color.dart';

class NoteColorsController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final RxList<NoteColor> _noteColors = <NoteColor>[
    NoteColor(
      name: 'Fire red',
      color: Constants.colors.redNote,
      index: 0,
    ),
    NoteColor(
      name: 'Cool blue',
      color: Constants.colors.blueNote,
      index: 1,
    ),
    NoteColor(
      name: 'Fancy indigo',
      color: Constants.colors.indigoNote,
      index: 2,
    ),
    NoteColor(
      name: 'Taxi yellow',
      color: Constants.colors.yellowNote,
      index: 3,
    ),
    NoteColor(
      name: 'Ecologically green',
      color: Constants.colors.greenNote,
      index: 4,
    ),
  ].obs;
  final Rx<NoteColor> _chosenColor = NoteColor(
    name: 'Fire red',
    color: Constants.colors.redNote,
    index: 0,
  ).obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  List<NoteColor> get noteColors => _noteColors;
  NoteColor get chosenColor => _chosenColor.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set noteColors(List<NoteColor> value) => _noteColors.assignAll(value);
  set chosenColor(NoteColor value) => _chosenColor.value = value;
}
