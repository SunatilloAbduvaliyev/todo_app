import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final bool isDone;
  @HiveField(3)
  final DateTime id;
  @HiveField(4)
  final DateTime endTime;
  @HiveField(5)
  final DateTime startTime;
  @HiveField(6)
  final DateTime searchId;
  @HiveField(7)
  final String color;

  TaskModel({
    required this.title,
    required this.description,
    required this.isDone,
    required this.id,
    required this.endTime,
    required this.startTime,
    required this.searchId,
    required this.color
  });
}
