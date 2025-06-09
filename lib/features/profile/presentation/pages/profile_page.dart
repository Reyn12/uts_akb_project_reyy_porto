import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uts_akb_project_reyy_portfo/features/profile/presentation/controller/profile_controller.dart';
import 'package:uts_akb_project_reyy_portfo/features/profile/presentation/widgets/header_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/profile/presentation/widgets/about_me_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/profile/presentation/widgets/contact_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/profile/presentation/widgets/location_widget.dart';
import 'package:uts_akb_project_reyy_portfo/features/profile/presentation/widgets/about_app_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

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
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Header(userProfile: userProfile),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AboutMeWidget(
                      description:
                          "Passionate mobile developer with 5+ years of experience in creating innovative applications. I love exploring new technologies and building solutions that make people's lives easier. When I'm not coding, you can find me hiking in the mountains or experimenting with photography.",
                    ),
                    ContactWidget(
                      phone: "+6281319678220",
                      email: "muhammadrenaldi687@gmail.com",
                    ),
                    LocationWidget(
                      location: "Kota Bandung, Indonesia",
                      availableForMeetups: true,
                    ),
                    AboutAppWidget(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
