import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen_app/controllers/onboarding_controller.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final onboardingController = Get.put(OnboardingController());

  updateSelectedIndex(int pageIndex) {
    onboardingController.selectedPageIndex.value = pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                // onPageChanged: onboardingController.selectedPageIndex,
                // Above line can also be used it has some RxInt logic.
                onPageChanged: updateSelectedIndex,
                controller: onboardingController.pageController,
                itemCount: onboardingController.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(onboardingController
                            .onboardingPages[index].imageAsset),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          onboardingController.onboardingPages[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        // Sizedbox() is not used because padding has done the job.
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                              onboardingController
                                  .onboardingPages[index].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              )),
                        ),
                      ],
                    ),
                  );
                }),
            // Position the 3 dots in bottom.
            Positioned(
              bottom: 50,
              left: 20,
              child: Row(
                  children: List.generate(
                      onboardingController.onboardingPages.length,
                      (index) => Obx(() => Container(
                            margin: const EdgeInsets.all(5),
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                                color: onboardingController
                                            .selectedPageIndex.value ==
                                        index
                                    ? Colors.red
                                    : Colors.grey,
                                shape: BoxShape.circle),
                          )))),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onboardingController.slidePage,
          child: Obx(() => Text(onboardingController.selectedPageIndex.value !=
                  onboardingController.onboardingPages.length - 1
              ? "Next"
              : 'Start')),
        ));
  }
}
