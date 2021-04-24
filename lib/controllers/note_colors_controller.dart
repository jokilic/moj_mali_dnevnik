import 'package:get/get.dart';

import '../constants/constants.dart';
import '../models/note_color.dart';

class NoteColorsController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final RxList<NoteColor> _noteColors = <NoteColor>[
    NoteColor(
      name: 'Kinda red',
      color: Constants.colors.red,
      index: 0,
    ),
    NoteColor(
      name: 'Fire red',
      color: Constants.colors.redNote,
      index: 1,
    ),
    NoteColor(
      name: 'Like blue',
      color: Constants.colors.blue,
      index: 2,
    ),
    NoteColor(
      name: 'Cool blue',
      color: Constants.colors.blueNote,
      index: 3,
    ),
    NoteColor(
      name: 'Fancy indigo',
      color: Constants.colors.indigoNote,
      index: 4,
    ),
    NoteColor(
      name: 'Weirdly yellow',
      color: Constants.colors.yellow,
      index: 5,
    ),
    NoteColor(
      name: 'Taxi yellow',
      color: Constants.colors.yellowNote,
      index: 6,
    ),
    NoteColor(
      name: 'Ecologically green',
      color: Constants.colors.greenNote,
      index: 7,
    ),
    NoteColor(
      name: 'Very green',
      color: Constants.colors.green,
      index: 8,
    ),
    NoteColor(
      name: 'Too black',
      color: Constants.colors.black,
      index: 9,
    ),
  ].obs;
  final Rx<NoteColor> _chosenColor = NoteColor(
    name: 'Like blue',
    color: Constants.colors.blue,
    index: 2,
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
