import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/style/app_text_style.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  final List<String> language = ['English', 'Russia', 'Uzbek'];
  String values = "Uzbek";
  @override
  Widget build(BuildContext context) {
  double width  = MediaQuery.of(context).size.width;
    return DropdownButton(
      value: values,
      style: AppTextStyle.medium.copyWith(
        fontSize: width*0.040,
        color: Theme.of(context).primaryColor
      ),
      items: List.generate(
          language.length,
              (index) => DropdownMenuItem(
            value: language[index],
            child:
            Text(language[index], style: AppTextStyle.medium),
          )),
      onChanged: (value) {
        if (value == 'English') {
          Get.updateLocale(const Locale('en_US'));
        } else if (value == 'Russia') {
          Get.updateLocale(const Locale('ru_RU'));
        } else if (value == 'Uzbek') {
          Get.updateLocale(const Locale('uz_UZ'));
        }
        values = value.toString();
        setState(() {});
      },
    );
  }
}

