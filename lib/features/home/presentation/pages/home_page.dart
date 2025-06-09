import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:uts_akb_project_reyy_portfo/features/home/presentation/controller/home_controller.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/friends_online_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/header_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/skeleton/header_skeleton.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/skeleton/stats_card_skeleton.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/skeleton/today_activities_skeleton.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/skeleton/friends_online_skeleton.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/stats_card_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/today_activities_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0,
        toolbarHeight: 0, // AppBar tanpa tinggi, cuma untuk warna status bar
      ),
      body: Obx(() {
        final userProfile = controller.userProfile.value;
        if (controller.isLoading.value) {
          // Loading: tampilkan skeleton
          return ListView(
            children: [
              HeaderSkeleton(),
              StatsCardSkeleton(),
              TodayActivitiesSkeleton(),
              FriendsOnlineSkeleton(),
              // Bisa tambahin skeleton lain juga di sini
            ],
          );
        }
        if (userProfile == null) {
          // Bisa kasih loading spinner atau skeleton
          return Center(child: Text('Data user nggak ada'));
        }
        return ListView(
          children: [
            Header(userProfile: userProfile),
            StatsCard(userProfile: userProfile),
            TodayActivities(
              activities: controller.activities,
              isLoading: controller.isLoading.value,
            ),
            FriendsOnline(
              friends: controller.friends,
              isLoading: controller.isLoading.value,
            ),
            SizedBox(height: 40),
          ],
        );
      }),
    );
  }
}
