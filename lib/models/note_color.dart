import 'dart:convert';

import 'package:flutter/painting.dart';

class NoteColor {
  final String name;
  final Color color;
  final int index;

  NoteColor({
    required this.name,
    required this.color,
    required this.index,
  });

  NoteColor copyWith({
    String? name,
    Color? color,
    int? index,
  }) =>
      NoteColor(
        name: name ?? this.name,
        color: color ?? this.color,
        index: index ?? this.index,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'color': color.value,
        'index': index,
      };

  factory NoteColor.fromMap(Map<String, dynamic> map) => NoteColor(
        name: map['name'],
        color: Color(map['color']),
        index: map['index'],
      );

  String toJson() => json.encode(toMap());

  factory NoteColor.fromJson(String source) =>
      NoteColor.fromMap(json.decode(source));
}
