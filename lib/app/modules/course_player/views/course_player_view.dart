import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning_app/app/shared/theme/constants.dart';
import '../controllers/course_player_controller.dart';

class CoursePlayerView extends GetView<CoursePlayerController> {
  const CoursePlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    // Data statis untuk materi selanjutnya
    final nextLessons = [
      "Instalasi Flutter di Windows",
      "Setup Android Studio",
      "Menjalankan Emulator",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Instalasi & Setup")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Area Player Video Placeholder
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              child: const Center(
                child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
              ),
            ),
          ),
          // 2. Judul Materi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Video: Instalasi Flutter di Windows",
              style: Get.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Materi Selanjutnya",
              style: Get.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 3. List Materi Selanjutnya
          Expanded(
            child: ListView.builder(
              itemCount: nextLessons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.play_circle_outline,
                    color: kPrimaryColor,
                  ),
                  title: Text(nextLessons[index]),
                  onTap: () {
                    // Logika pindah video
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
