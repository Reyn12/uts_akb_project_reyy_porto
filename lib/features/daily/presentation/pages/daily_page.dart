import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/domain/entities/gallery_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/presentation/controller/daily_controller.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/presentation/widgets/gallery_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/presentation/widgets/music_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/daily/presentation/widgets/today_schedule_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/controller/home_controller.dart'
    as home;
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/friends_online_widget.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<home.HomeController>();
    final dailyController = Get.find<DailyController>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Daily Activities',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Text(
              'as a Mobile Dev',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: Obx(() {
        if (homeController.isLoading.value || dailyController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TodaySchedule(
                activities: homeController.activities,
                isLoading: homeController.isLoading.value,
              ),
              FriendsOnline(
                friends: homeController.friends,
                isLoading: homeController.isLoading.value,
              ),
              GalleryWidget(
                galleryList: dailyController.galleryList,
                isLoading: dailyController.isLoading.value,
              ),
              MusicWidget(
                musicList: dailyController.musicList,
                isLoading: dailyController.isLoading.value,
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}
