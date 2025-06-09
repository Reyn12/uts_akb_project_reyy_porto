import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:uts_akb_project_reyy_portfo/features/onboarding/presentation/pages/onboarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Atur status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    // Buat controller animasi
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Jalankan animasi dan pindah ke halaman onboarding setelah selesai
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.offAll(() => const OnboardingPage());
      }
    });

    // Jalankan animasi
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animasi Lottie
            Lottie.asset(
              'assets/lotties/splash_animation.json',
              controller: _controller,
              width: 250,
              height: 250,
              fit: BoxFit.contain,
              // Gunakan onLoaded jika file lottie belum ada
              onLoaded: (composition) {
                // Sesuaikan durasi controller dengan durasi animasi
                _controller.duration = composition.duration;
                _controller.forward();
              },
            ),
            const SizedBox(height: 30),
            // Nama aplikasi
            const Text(
              'Reyy Portfolio',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            // Tagline
            const Text(
              'Tugas UTS AKB',
              style: TextStyle(fontSize: 24, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
