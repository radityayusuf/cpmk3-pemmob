import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:elearning_app/app/shared/theme/constants.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({super.key});

  final List<Widget> onboardingPages = [
    _buildOnboardingPage(
      icon: Icons.school,
      title: "Selamat Datang di EduCourse",
      description: "Temukan ribuan kursus online dari instruktur terbaik.",
    ),
    _buildOnboardingPage(
      icon: Icons.laptop_chromebook,
      title: "Belajar Kapan Saja, Di Mana Saja",
      description: "Akses materi kursus melalui perangkat mobile Anda.",
    ),
    _buildOnboardingPage(
      icon: Icons.military_tech,
      title: "Dapatkan Sertifikat",
      description: "Selesaikan kursus dan dapatkan sertifikat resmi.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: carousel.CarouselSlider(
                items: onboardingPages,
                carouselController: controller.carouselController,
                options: carousel.CarouselOptions(
                  height: Get.height * 0.6,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    controller.onPageChanged(index);
                  },
                ),
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: onboardingPages.asMap().entries.map((entry) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Get.isDarkMode ? Colors.white : kPrimaryColor)
                          .withOpacity(
                        controller.currentPage.value == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: controller.goToHome,
                child: const Text("Mulai Belajar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildOnboardingPage({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 120, color: kPrimaryColor),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Get.textTheme.titleMedium?.copyWith(color: kTextColor),
          ),
        ],
      ),
    );
  }
}
