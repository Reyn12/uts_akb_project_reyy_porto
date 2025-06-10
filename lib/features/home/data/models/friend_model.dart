import 'package:uts_akb_project_reyy_portfo/features/home/domain/entities/friend_entity.dart';

class FriendModel extends FriendEntity {
  FriendModel({
    required super.name,
    required super.profilePictureUrl,
    required super.isOnline,
  });

  factory FriendModel.fromJson(Map<String, dynamic> json) {
    return FriendModel(
      name: json['name'] as String,
      profilePictureUrl: json['profilePictureUrl'] as String,
      isOnline: json['isOnline'] as bool,
    );
  }
}
