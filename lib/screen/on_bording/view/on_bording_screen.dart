import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/screen/on_bording/on_boardin_controller.dart';
import 'package:todo_app/utils/extension/extension.dart';
import 'package:todo_app/utils/style/app_text_style.dart';
import '../../../data/repositories/on_boarding_repository/on_boarding_repository.dart';
import '../../../utils/colors/app_colors.dart';
import '../../global_widget/laguage_button_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  var pageViewController = Get.put(PageViewController());

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: () {},
            child: Text(
              'skip'.tr,
              style: AppTextStyle.medium.copyWith(fontSize: width * 0.040),
            ),
          ),
          actions: const [
            LanguageButton(),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: List.generate(
            pageData.length,
            (index) => ListView(
              children: [
                Image.asset(
                  pageData[index].image,
                  width: width * 0.7,
                  height: height * 0.4,
                ),
                30.boxH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    pageData[index].title.tr,
                    style:
                        AppTextStyle.semiBold.copyWith(fontSize: width * 0.060),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    pageData[index].description.tr,
                    style:
                        AppTextStyle.regular.copyWith(fontSize: width * 0.040),
                    textAlign: TextAlign.center,
                  ),
                ),
                20.boxH(),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        pageData.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: 26.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                              color:
                                  pageViewController.activeIndex.value == index
                                      ? AppColors.c80FFFF
                                      : AppColors.cAFAFAF,
                              borderRadius: BorderRadius.circular(56.r)),
                        ),
                      ),
                    ],
                  ),
                ),
                40.boxH(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Visibility(
                          visible: pageViewController.isVisible.value,
                          child: TextButton(
                            onPressed: () {
                              pageViewController.backPageIndex();
                              pageController.jumpToPage(
                                  pageViewController.activeIndex.value);
                            },
                            child: Text('back'.tr,
                                style: AppTextStyle.medium
                                    .copyWith(fontSize: width * 0.040)),
                          ),
                        ),
                      ),
                      Ink(
                        decoration: BoxDecoration(
                          color: AppColors.c_8875FF,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            pageViewController.nextPageIndex();
                            pageController.jumpToPage(
                                pageViewController.activeIndex.value);
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 24.w, vertical: 12.h),
                            child: Obx(
                              () => Text(
                                  pageViewController.activeIndex.value ==
                                          pageData.length - 1
                                      ? 'get_started'.tr
                                      : 'next'.tr,
                                  style: AppTextStyle.medium.copyWith(
                                    fontSize: width * 0.040,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
