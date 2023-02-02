import 'dart:convert';

class Todo {
  final String? id;
  final String title;
  final String day;
  final String time;
  bool? isDone;
  Todo({
    required this.id,
    required this.title,
    required this.day,
    required this.time,
    this.isDone,
  }) {
    isDone = isDone ?? false;
  }

  Todo copyWith({
    String? id,
    String? title,
    String? day,
    String? time,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      day: day ?? this.day,
      time: time ?? this.time,
      isDone: isDone ?? this.isDone,
    );
  }
}
