import 'dart:convert';

class Task {
  int? id;
  String subject;
  String task;
  String dateLimit;
  int completed;

  Task({
    this.id,
    required this.subject,
    required this.task,
    required this.dateLimit,
    required this.completed,
  });

  Task copyWith({
    int? id,
    String? subject,
    String? task,
    String? dateLimit,
    int? completed,
  }) =>
      Task(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        task: task ?? this.task,
        dateLimit: dateLimit ?? this.dateLimit,
        completed: completed ?? this.completed,
      );

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"],
        subject: json["subject"],
        task: json["task"],
        dateLimit: json["date_limit"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "subject": subject,
        "task": task,
        "date_limit": dateLimit,
        "completed": completed,
      };
}
