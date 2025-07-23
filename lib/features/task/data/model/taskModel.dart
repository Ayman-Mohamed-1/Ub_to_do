import 'dart:ui';

import 'package:up_to_do/core/utils/app_colors.dart';

class TaskModel {
  final int id;
  final String title;
  final String startTime;
  final String endTime;
  final String task;
  final String? date;
  final int color;
  final bool isComplete;

  TaskModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.task,
    required this.color,
    required this.isComplete,
    this.date,
  });

  // لتحويل من Map (مثلاً من Firebase أو SQLite)
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      task: map['task'] ?? '',
      isComplete: map['isComplete'] ?? false,
      color: map['color'] ?? 1,
    );
  }

  // لتحويل لـ Map (للتخزين أو الإرسال)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'startTime': startTime,
      'endTime': endTime,
      'task': task,
      'isComplete': isComplete,
      'color': color,
    };
  }
}
