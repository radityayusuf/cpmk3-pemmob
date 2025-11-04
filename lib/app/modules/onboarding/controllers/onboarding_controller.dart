import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:elearning_app/app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final carousel.CarouselController carouselController =
      carousel.CarouselController();
  final RxInt currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void goToHome() {
    // Gunakan offAllNamed agar tidak bisa kembali ke onboarding
    Get.offAllNamed(Routes.HOME);
  }
}
