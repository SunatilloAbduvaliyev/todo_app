import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final List<String> tasks;
  @HiveField(2)
  final List<DateTime> dates;
  @HiveField(3)
  final List<bool> isDone;
  @HiveField(4)
  final int id;

  TaskModel({
    required this.tasks,
    required this.dates,
    required this.isDone,
    required this.id,
  });
}
