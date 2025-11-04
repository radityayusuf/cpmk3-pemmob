import 'package:get/get.dart';

// Import semua file binding dan view dari setiap modul
import 'package:elearning_app/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:elearning_app/app/modules/onboarding/views/onboarding_view.dart';
import 'package:elearning_app/app/modules/home/bindings/home_binding.dart';
import 'package:elearning_app/app/modules/home/views/home_view.dart';
import 'package:elearning_app/app/modules/course_detail/bindings/course_detail_binding.dart';
import 'package:elearning_app/app/modules/course_detail/views/course_detail_view.dart';
import 'package:elearning_app/app/modules/course_player/bindings/course_player_binding.dart';
import 'package:elearning_app/app/modules/course_player/views/course_player_view.dart';
import 'package:elearning_app/app/modules/profile/bindings/profile_binding.dart';
import 'package:elearning_app/app/modules/profile/views/profile_view.dart';

// Import file nama rute
import 'app_routes.dart';

abstract class AppPages {
  // Rute awal saat aplikasi dibuka
  static const INITIAL = Routes.ONBOARDING;

  // Daftar semua halaman/rute yang ada di aplikasi
  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: Routes.COURSE_DETAIL,
      page: () => CourseDetailView(),
      binding: CourseDetailBinding(),
      transition: Transition.rightToLeft, // Contoh transisi
    ),
    GetPage(
      name: Routes.COURSE_PLAYER,
      page: () => CoursePlayerView(),
      binding: CoursePlayerBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.downToUp, // Contoh transisi
    ),
  ];
}
