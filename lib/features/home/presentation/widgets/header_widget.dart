import 'package:flutter/material.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/user_profile_entity.dart';

class Header extends StatelessWidget {
  final UserProfileEntity userProfile;

  const Header({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[400],
                ),
              ),
              ClipOval(
                child: Image.asset(
                  userProfile.profilePictureUrl!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 20,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green[300],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            userProfile.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            userProfile.role,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 28),
                    Icon(Icons.star, color: Colors.amber, size: 28),
                    Icon(Icons.star, color: Colors.amber, size: 28),
                    Icon(Icons.star, color: Colors.amber, size: 28),
                    Icon(Icons.star, color: Colors.amber, size: 28),
                    SizedBox(width: 8),
                    Text(
                      userProfile.rating.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
