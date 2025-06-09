import 'package:flutter/material.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({super.key, required this.userProfile});

  final UserProfileEntity? userProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Projects
          Container(
            width: 120,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade50.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.blue.shade100),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userProfile?.projects.toString() ?? '0',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Projects",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Friends
          Container(
            width: 120,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.shade50.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.green.shade100),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userProfile!.friends.toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Friends",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Photos
          Container(
            width: 120,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.shade50.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.purple.shade100),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userProfile!.photos.toString(),
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple.shade700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Photos",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.purple.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
