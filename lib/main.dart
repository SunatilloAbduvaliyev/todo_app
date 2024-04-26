import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/screen/route.dart';
import 'package:todo_app/screen/theme/app_theme.dart';
import 'package:todo_app/services/services_locator.dart';
import 'package:todo_app/utils/translations/translations.dart';

import 'data/model/reminder_model/reminder_model.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<ReminderModel>(ReminderModelAdapter());
  await Hive.initFlutter();
  setUpDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        ScreenUtil.init(context);
        return ThemeProvider(
            initTheme:AppTheme.lightTheme,
          builder: (_, theme){
              return GetMaterialApp(
                theme:  theme,
                debugShowCheckedModeBanner: false,
                translations: AppTranslations(),
                locale: const Locale('uz', 'Uz'),
                fallbackLocale: const Locale('uz', 'Uz'),
                onGenerateRoute: AppRoute.generateRoute,
                initialRoute: RouteName.splashScreen,
              );
          },
        );
      },
    );
  }
}
