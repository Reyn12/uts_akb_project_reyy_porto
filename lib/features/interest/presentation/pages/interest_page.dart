import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/controller/interest_controller.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/hobbies_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/not_my_thing_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/things_i_love_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/goals_widget.dart';

// Import skeleton
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/skeleton/hobbies_skeleton.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/skeleton/things_i_love_skeleton.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/skeleton/not_my_thing_skeleton.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/skeleton/goals_skeleton.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InterestController>();

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
              'Interest',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Text(
              'Things that inspire me',
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
        if (controller.isLoading.value) {
          // TAMPILIN SKELETON SEMUA
          return SingleChildScrollView(
            child: Column(
              children: const [
                HobbiesSkeleton(),
                ThingsILoveSkeleton(),
                NotMyThingSkeleton(),
                GoalsSkeleton(),
              ],
            ),
          );
        }
        // TAMPILIN DATA ASLI
        return SingleChildScrollView(
          child: Column(
            children: [
              Hobbies(
                hobbies: controller.hobbyList,
                isLoading: controller.isLoading.value,
              ),
              ThingsILove(
                myLove: controller.myLoveList,
                isLoading: controller.isLoading.value,
              ),
              NotMyThing(
                notMyLove: controller.notMyLoveList,
                isLoading: controller.isLoading.value,
              ),
              GoalsWidget(
                goals: controller.goalsList,
                isLoading: controller.isLoading.value,
              ),
            ],
          ),
        );
      }),
    );
  }
}
