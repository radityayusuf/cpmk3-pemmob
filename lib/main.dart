import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 1. Impor file Peta Halaman (AppPages) Anda
import 'app/routes/app_pages.dart';

// 2. Impor file konstanta tema Anda
import 'app/shared/theme/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 3. Gunakan GetMaterialApp sebagai widget root
    return GetMaterialApp(
      title: 'Aplikasi E-Learning',
      debugShowCheckedModeBanner: false,

      // 4. Definisikan Tema global aplikasi Anda di sini
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: kTextColor),
          headlineSmall: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),

      // 5. Tentukan Rute Awal (Halaman Pertama) dari AppPages
      initialRoute: AppPages.INITIAL,

      // 6. Daftarkan semua halaman/rute dari AppPages
      getPages: AppPages.routes,
    );
  }
}
