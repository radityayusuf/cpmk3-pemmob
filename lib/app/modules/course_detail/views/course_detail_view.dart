import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning_app/app/routes/app_routes.dart';
import 'package:elearning_app/app/shared/theme/constants.dart';
import '../controllers/course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  const CourseDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Kursus")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Gambar/Video Preview
            Container(
              height: 220,
              color: kPrimaryLightColor,
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  size: 80,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Judul Kursus
                  Text(
                    "Belajar Flutter dari Nol hingga Mahir",
                    style: Get.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // 3. Nama Instruktur
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          Icons.person,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Budi Santoso",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // 4. Deskripsi
                  const Text(
                    "Deskripsi: Kursus ini akan membimbing Anda untuk menjadi seorang developer Flutter profesional. Kita akan belajar mulai dari dasar Dart, widget, state management (GetX), hingga mempublish aplikasi ke Play Store dan App Store.",
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  // 5. List Modul/Materi
                  Text(
                    "Materi Pelajaran",
                    style: Get.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildModuleList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          // Navigasi ke Halaman Player
          onPressed: () => Get.toNamed(Routes.COURSE_PLAYER),
          child: const Text("Mulai Belajar Sekarang"),
        ),
      ),
    );
  }

  Widget _buildModuleList() {
    // Data statis untuk modul
    final modules = [
      "Pendahuluan",
      "Instalasi & Setup",
      "Dasar-dasar Dart",
      "Widget Dasar Flutter",
      "State Management (GetX)",
      "Navigasi & Routing",
      "Final Project",
    ];

    return ListView.builder(
      itemCount: modules.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 6),
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: kPrimaryLightColor,
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              modules[index],
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(Icons.play_arrow, color: kPrimaryColor),
            // Navigasi ke Halaman Player
            onTap: () => Get.toNamed(Routes.COURSE_PLAYER),
          ),
        );
      },
    );
  }
}
