import 'dart:convert';

class Note {
  final int? id;
  final String title;
  final String content;
  final int color;
  final DateTime date;

  Note({
    required this.title,
    required this.content,
    required this.color,
    required this.date,
    this.id,
  });

  Note copyWith({
    int? id,
    String? title,
    String? content,
    int? color,
    DateTime? date,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        color: color ?? this.color,
        date: date ?? this.date,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'color': color,
        'date': date.toIso8601String(),
      };

  factory Note.fromMap(Map<String, dynamic> map) => Note(
        id: map['id'],
        title: map['title'],
        content: map['content'],
        color: map['color'],
        date: DateTime.parse(map['date']),
      );

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
