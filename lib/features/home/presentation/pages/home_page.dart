import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/controller/home_controller.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/friends_online_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/header_widget.dart';
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
        if (userProfile == null) {
          // Bisa kasih loading spinner atau skeleton
          return Center(child: CircularProgressIndicator());
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
