import 'package:flutter/material.dart';
import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/friend_entity.dart';

class FriendsOnline extends StatelessWidget {
  const FriendsOnline({
    super.key,
    required this.friends,
    required this.isLoading,
  });

  final List<FriendEntity> friends;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // Filter hanya teman yang online
    final onlineFriends = friends.where((friend) => friend.isOnline).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(32),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.people, color: Colors.green, size: 20),
                ),
                SizedBox(width: 12),
                Text(
                  "Friends Online",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (isLoading && onlineFriends.isEmpty)
              Center(child: CircularProgressIndicator())
            else if (onlineFriends.isEmpty)
              Center(
                child: Text(
                  "Tidak ada teman yang online",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            else
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      onlineFriends.map((friend) {
                        return Container(
                          width: 80, // Lebar tetap untuk semua item
                          margin: EdgeInsets.only(right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.circle,
                                      image:
                                          friend.profilePictureUrl != null
                                              ? DecorationImage(
                                                image: AssetImage(
                                                  friend.profilePictureUrl!,
                                                ),
                                                fit: BoxFit.cover,
                                              )
                                              : null,
                                    ),
                                    child:
                                        friend.profilePictureUrl == null
                                            ? Icon(
                                              Icons.person,
                                              size: 30,
                                              color: Colors.grey.shade400,
                                            )
                                            : null,
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                friend.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
