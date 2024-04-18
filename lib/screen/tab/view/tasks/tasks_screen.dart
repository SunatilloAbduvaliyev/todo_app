import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import '../../../global_widget/drawer_widget.dart';
import '../../../theme/app_theme.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var darkTheme = AppTheme.darkTheme;
  var lightTheme = AppTheme.lightTheme;
  @override
  Widget build(BuildContext context) {
    return  ThemeSwitchingArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar:  AppBar(
          title: const Text('TaskScreen'),
          actions: [
            ThemeSwitcher(
              builder: (BuildContext context ) {
                return IconButton(onPressed: (){
                  var brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
                  ThemeSwitcher.of(context).changeTheme(
                    theme: brightness == Brightness.light?darkTheme:lightTheme,
                    isReversed: brightness == Brightness.light?true:false,
                  );
                }, icon:
                 Icon(
                    ThemeModelInheritedNotifier.of(context).theme.brightness==Brightness.light? Icons.dark_mode:Icons.light_mode,color: Colors.black,));
              },

            )
          ],
        ),
      ),
    );
  }
}
