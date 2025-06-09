import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/controller/interest_controller.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/goals_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/hobbies_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/not_my_thing_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/presentation/widgets/things_i_love_widget.dart';

class InterestPage extends GetView<InterestController> {
  const InterestPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              'My Interests',
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
      body: Obx(
        () => SingleChildScrollView(
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
        ),
      ),
    );
  }
}
