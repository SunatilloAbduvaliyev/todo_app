import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_theme.dart';
import 'laguage_button_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              reverseDuration: const Duration(milliseconds: 500),
              switchInCurve: Curves.bounceInOut,
              switchOutCurve: Curves.easeInOutSine,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: ThemeSwitcher(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () {
                      var brightness =
                          ThemeModelInheritedNotifier.of(context).theme.brightness;
                      ThemeSwitcher.of(context).changeTheme(
                        theme: brightness == Brightness.light ? AppTheme.darkTheme : AppTheme.lightTheme,
                        isReversed: brightness == Brightness.light ? true : false,
                      );
                    },
                    icon: Icon(
                      ThemeModelInheritedNotifier.of(context).theme.brightness ==
                          Brightness.light
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
            const LanguageButton()
          ],
        ),
      ),
    );
  }
}
