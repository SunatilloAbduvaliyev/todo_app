import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/screen/route.dart';
import 'package:todo_app/utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _init()async{
    await Future.delayed(const Duration(seconds: 1),(){
     Navigator.pushReplacementNamed(context, RouteName.onBoardingScreen);
    });
  }
  @override
  void initState(){
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                    height: 300,
                    child: Lottie.asset(AppImages.upTodo),),
              ],
            ),
          ),
        )
    );
  }
}
