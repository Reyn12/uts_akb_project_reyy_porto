import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/controller/home_controller.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/header_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/presentation/widgets/stats_card_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final userProfile = controller.userProfile.value;
        if (userProfile == null) {
          // Bisa kasih loading spinner atau skeleton
          return Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Header(userProfile: userProfile),
            StatsCard(userProfile: userProfile),
          ],
        );
      }),
    );
  }
}
