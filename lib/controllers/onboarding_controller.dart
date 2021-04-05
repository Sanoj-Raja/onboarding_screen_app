import 'package:flutter/material.dart';
import 'package:onboarding_screen_app/models/onboarding_info.dart';
import 'package:get/state_manager.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  final pageController = PageController();

  slidePage() {
    if (selectedPageIndex.value == onboardingPages.length - 1) {
      // do nothing.
    } else
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/order.png', 'Order Food & Beverages Online',
        'Top-rated dishes delivered to you. Get Upto 50% Off on your first order, use code SANOJ_RAJA. Temperature Checks, Sanitized Kitchens, Gloves & Masks Changed Daily'),
    OnboardingInfo('assets/cook.png', 'Take Your Restaurant Online',
        'Enjoy A New, Exciting Box Full Of Delicious Meals Every Day With Us. Change The Way You Eat, Check Now.'),
    OnboardingInfo('assets/deliver.png', 'Instant Food Delivery',
        'We deliver food from your neighborhood local joints, your favorite cafes, luxurious & elite restaurants in your area. Exciting bit?')
  ];
}
