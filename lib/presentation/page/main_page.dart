import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/presentation/binding/daily_binding.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/presentation/pages/daily_page.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/binding/home_binding.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/pages/home_page.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/binding/interest_binding.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/pages/interest_page.dart';
import 'package:uts_akb_project_reyy_portfo/features/profile/presentation/binding/profile_binding.dart';
import 'package:uts_akb_project_reyy_portfo/features/profile/presentation/pages/profile_page.dart';
import 'package:uts_akb_project_reyy_portfo/presentation/controller/main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller
    final MainController controller = Get.put(MainController());

    // Inisialisasi binding
    HomeBinding().dependencies();

    DailyBinding().dependencies();

    InterestBinding().dependencies();

    ProfileBinding().dependencies();

    // Daftar halaman yang akan ditampilkan
    final List<Widget> pages = [
      HomePage(),
      DailyPage(),
      InterestPage(),
      ProfilePage(),
    ];

    return Scaffold(
      // Menggunakan Obx untuk memantau perubahan pada currentIndex
      body: Obx(() => pages[controller.currentIndex.value]),

      // Convex Bottom Bar
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: Colors.blue[900],
        height: 60,
        color: Colors.white60,
        activeColor: Colors.white,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.calendar_today, title: 'Daily'),
          TabItem(icon: Icons.favorite, title: 'Interest'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: 0, // Halaman awal
        onTap: (int index) {
          // Mengubah halaman ketika tab ditekan
          controller.changePage(index);
        },
      ),
    );
  }
}
