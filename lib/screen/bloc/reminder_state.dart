import 'package:equatable/equatable.dart';

import '../../../../../data/model/reminder_model/reminder_model.dart';

abstract class DataState {}

class InitialDateState extends DataState {}

class SuccessDataState extends DataState with EquatableMixin {
  final List<ReminderModel> data;

  SuccessDataState({required this.data});

  @override
  List<Object?> get props => [
        data,
      ];
}

class LoadingDataState extends DataState {}

class ReminderErrorState extends DataState with EquatableMixin {
  final String errorMessage;

  ReminderErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
