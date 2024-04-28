import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/screen/bloc/reminder_bloc.dart';
import 'package:todo_app/screen/global_widget/drawer_widget.dart';
import 'package:todo_app/screen/tab/view/reminder/dialogs/add_reminder_dialog.dart';

import '../../../../../utils/images/app_images.dart';
import '../../../../bloc/reminder_state.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('-------------------------------------------------build run');
    return ThemeSwitchingArea(
      child: SafeArea(
        child: Scaffold(
          drawerScrimColor: Theme.of(context).colorScheme.background,
          drawer: const DrawerWidget(),
          appBar: AppBar(
            title: Text('reminder_screen'.tr),
          ),
          body: BlocBuilder<DataBloc, DataState>(
            builder: (BuildContext context, state) {
              if (state is LoadingDataState) {
                return Center(
                  child: Lottie.asset(AppImages.loading),
                );
              }
              return Center(
                child: Lottie.asset(AppImages.reminderLottie),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              addReminderDialog(context: context);
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
