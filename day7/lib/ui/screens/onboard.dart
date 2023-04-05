import 'package:day7/app/controllers/onboard_controller.dart';
import 'package:day7/data/onboard_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../routes/routes.dart';
import '../widgets/onboard/onboard_content.dart';

class OnBoard extends GetView<OnBoardController> {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                alignment: const Alignment(0, 0.88),
                children: [
                  PageView.builder(
                      itemCount: 3,
                      controller: controller.c,
                      onPageChanged: controller.pageChange,
                      itemBuilder: (context, index) {
                        return OnBoardContent(
                            title: onboardData[index].title,
                            image: onboardData[index].image,
                            description: onboardData[index].description);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            controller.c.jumpToPage(2);
                          },
                          child: const Text("Skip")),
                      SmoothPageIndicator(
                        controller: controller.c,
                        count: 3,
                        effect: const ExpandingDotsEffect(expansionFactor: 2),
                      ),
                      Obx(() {
                        return controller.lastPage.isTrue
                            ? TextButton(
                                onPressed: () {
                                  Get.offNamed(Routes.home);
                                },
                                child: const Text("Done"))
                            : TextButton(
                                onPressed: () {
                                  controller.c.nextPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut);
                                },
                                child: const Text("Next"));
                      })
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
