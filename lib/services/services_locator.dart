import 'package:get_it/get_it.dart';

import '../data/local/local_storage/reminder_local_storage.dart';
import '../data/local/local_storage/task_local_storage.dart';

final GetIt getIt = GetIt.instance;

void setUpDI(){
  getIt.registerSingleton<DataCrudController>(DataCrudController());
  getIt.registerSingleton<TaskCrudController>(TaskCrudController());
}