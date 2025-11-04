import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning_app/app/routes/app_routes.dart';
import 'package:elearning_app/app/shared/theme/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EduCourse"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            // Navigasi ke Halaman Profile
            onPressed: () => Get.toNamed(Routes.PROFILE),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selamat Datang, User!", style: Get.textTheme.headlineSmall),
              const SizedBox(height: 8),
              const Text("Mau belajar apa hari ini?"),
              const SizedBox(height: 20),
              // 1. Search Bar
              const TextField(
                decoration: InputDecoration(
                  hintText: "Cari kursus...",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 24),
              // 2. Grid Kategori Kursus
              _buildSectionTitle("Kategori Kursus"),
              _buildCategoryGrid(),
              const SizedBox(height: 24),
              // 3. List Horizontal "Kursus yang Sedang Diikuti"
              _buildSectionTitle("Kursus yang Sedang Diikuti"),
              _buildHorizontalCourseList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Get.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCategoryGrid() {
    // Data statis untuk kategori
    final categories = [
      {"name": "Programming", "icon": Icons.code},
      {"name": "Desain", "icon": Icons.design_services},
      {"name": "Bisnis", "icon": Icons.business_center},
      {"name": "Marketing", "icon": Icons.trending_up},
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.5,
      ),
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildCategoryCard(
          categories[index]["name"] as String,
          categories[index]["icon"] as IconData,
        );
      },
    );
  }

  Widget _buildCategoryCard(String name, IconData icon) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navigasi bisa ditambahkan di sini
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: kPrimaryColor, size: 30),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalCourseList() {
    // Data statis untuk kursus
    final courses = [
      {"title": "Flutter Lengkap", "progress": 0.5, "image": "flutter"},
      {"title": "UI/UX Desain", "progress": 0.8, "image": "uiux"},
      {"title": "Digital Marketing", "progress": 0.2, "image": "marketing"},
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return _buildCourseCard(
            courses[index]["title"] as String,
            courses[index]["progress"] as double,
          );
        },
      ),
    );
  }

  Widget _buildCourseCard(String title, double progress) {
    return GestureDetector(
      // Navigasi ke Halaman Detail Kursus
      onTap: () => Get.toNamed(Routes.COURSE_DETAIL),
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 50, color: kPrimaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
