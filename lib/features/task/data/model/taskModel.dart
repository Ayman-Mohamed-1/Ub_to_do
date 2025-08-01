class TaskModel {
  final int? id;
  final String title;
  final String startTime;
  final String endTime;
  final String task;
  final String? date;
  final int color;
  final bool isComplete;

  TaskModel({
    this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.task,
    required this.color,
    required this.isComplete,
    required this.date,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      date: map['date'],
      title: map['title'],
      task: map['task'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      isComplete: map['isComplete'] == 1, // هنا التحويل مهم جدًا
      color: map['color'],
    );
  }
}
