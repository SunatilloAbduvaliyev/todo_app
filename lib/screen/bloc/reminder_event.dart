import 'package:equatable/equatable.dart';

import '../../../../../data/model/reminder_model/reminder_model.dart';

abstract class DataEvent {}

class InsertDataEvent extends DataEvent with EquatableMixin {
  final ReminderModel model;

  InsertDataEvent({required this.model});

  @override
  List<Object?> get props => [
        model,
      ];
}

class UpdateDateEvent extends DataEvent with EquatableMixin {
  final ReminderModel model;

  UpdateDateEvent({required this.model});

  @override
  List<Object?> get props => [
        model,
      ];
}

class DeleteDataEvent extends DataEvent with EquatableMixin {
  final int dbId;

  DeleteDataEvent({required this.dbId});

  @override
  List<Object?> get props => [
        dbId,
      ];
}

class GetAllDataEvent extends DataEvent {}

class RestartDataEvent extends DataEvent{}
