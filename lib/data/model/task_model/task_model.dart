import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final List<String> tasks;
  @HiveField(2)
  final List<DateTime> startTime;
  @HiveField(3)
  final List<bool> isDone;
  @HiveField(4)
  final DateTime id;
  @HiveField(5)
  final List<DateTime> endTime;

  TaskModel({
    required this.tasks,
    required this.startTime,
    required this.isDone,
    required this.id,
    required this.endTime
  });
}
