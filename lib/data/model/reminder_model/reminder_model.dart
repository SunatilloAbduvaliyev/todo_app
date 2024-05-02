import 'package:hive/hive.dart';
part 'reminder_model.g.dart';

@HiveType(typeId: 0)
class ReminderModel{
  @HiveField(0)
  final String  title;
  @HiveField(1)
  final List<String> tasks;
  @HiveField(2)
  final List<bool> isCheck;
  @HiveField(3)
  final DateTime dateTime;
  @HiveField(4)
  final int id;
  @HiveField(5)
  final DateTime dateOrder;

  ReminderModel({
    required this.id,
    required this.title,
    required this.tasks,
    required this.isCheck,
    required this.dateTime,
    required this.dateOrder,
});
  
}