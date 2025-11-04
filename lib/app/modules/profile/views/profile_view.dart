import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning_app/app/routes/app_routes.dart';
import 'package:elearning_app/app/shared/theme/constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Saya")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. Info Akun
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: kPrimaryLightColor,
                child: Icon(Icons.person, size: 60, color: kPrimaryColor),
              ),
            ),
            const SizedBox(height: 12),
            Text("User Name", style: Get.textTheme.headlineSmall),
            const Text("user.name@email.com"),
            const SizedBox(height: 16),
            Chip(
              label: const Text(
                "Total Poin: 1500 XP",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: kPrimaryLightColor,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
            const SizedBox(height: 24),
            // 2. Menu
            _buildProfileMenu(
              icon: Icons.military_tech,
              text: "Sertifikat Saya",
              onTap: () {},
            ),
            _buildProfileMenu(
              icon: Icons.payment,
              text: "Riwayat Pembayaran",
              onTap: () {},
            ),
            _buildProfileMenu(
              icon: Icons.settings,
              text: "Pengaturan Akun",
              onTap: () {},
            ),
            _buildProfileMenu(
              icon: Icons.help_outline,
              text: "Bantuan",
              onTap: () {},
            ),
            const Divider(),
            _buildProfileMenu(
              icon: Icons.logout,
              text: "Logout",
              color: Colors.red,
              onTap: () {
                // Kembali ke halaman Onboarding
                Get.offAllNamed(Routes.ONBOARDING);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenu({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: color ?? kPrimaryColor),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: color ?? kTextColor,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: color ?? kTextColor,
        ),
        onTap: onTap,
      ),
    );
  }
}
