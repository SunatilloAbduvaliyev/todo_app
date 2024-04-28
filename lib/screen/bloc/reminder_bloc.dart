import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/local/local_storage.dart';
import 'package:todo_app/screen/bloc/reminder_event.dart';
import 'package:todo_app/screen/bloc/reminder_state.dart';

import '../../../../../data/model/reminder_model/reminder_model.dart';
import '../../../../../services/services_locator.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(InitialDateState()) {
    on<GetAllDataEvent>(_getAllReminders);
    on<InsertDataEvent>(_insertReminder);
    on<DeleteDataEvent>(_deleteReminder);
    on<RestartDataEvent>(_restartReminder);
  }

  Future<void> _getAllReminders(
    GetAllDataEvent event,
    Emitter<DataState> emit,
  ) async {
    emit(
      LoadingDataState(),
    );
    try {
      emit(
        SuccessDataState(
          data: await getIt.get<ReminderCrudController>().getAllQr(),
        ),
      );
    } catch (error) {
      emit(
        ReminderErrorState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _insertReminder(
    InsertDataEvent event,
    Emitter<DataState> emit,
  ) async {
    emit(
      LoadingDataState(),
    );
    try {
      await getIt.get<ReminderCrudController>().insertReminder(event.model);
      add(
        GetAllDataEvent(),
      );
    } catch (error) {
      emit(
        ReminderErrorState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
  
  void _deleteReminder(DeleteDataEvent event, Emitter<DataState> emit,){
    emit(
      LoadingDataState(),
    );
    try {
       getIt.get<ReminderCrudController>().deleteReminder(id: event.dbId);
      add(
        GetAllDataEvent(),
      );
    } catch (error) {
      emit(
        ReminderErrorState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
  
  Future<void> _restartReminder(RestartDataEvent event, Emitter<DataState> emit,)async{
    emit(
      LoadingDataState(),
    );
    try {
      List<ReminderModel>  data = await getIt.get<ReminderCrudController>().getAllQr();
      await Future.forEach(data, (element){
         getIt.get<ReminderCrudController>().deleteReminder(id: element.id);
      });
      emit(InitialDateState(),);
    } catch (error) {
      emit(
        ReminderErrorState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
