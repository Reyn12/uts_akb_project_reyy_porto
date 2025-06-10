import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
    required super.name,
    required super.role,
    required super.rating,
    required super.projects,
    required super.friends,
    required super.photos,
    super.profilePictureUrl,
    required super.isOnline,
  });

  // Factory method to create UserProfileModel from JSON
  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] as String,
      role: json['role'] as String,
      rating: (json['rating'] as num).toDouble(),
      projects: json['projects'] as int,
      friends: json['friends'] as int,
      photos: json['photos'] as int,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      isOnline: json['isOnline'] as bool,
    );
  }

  // Method to convert model to JSON (optional, kalau butuh)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'rating': rating,
      'projects': projects,
      'friends': friends,
      'photos': photos,
      'profilePictureUrl': profilePictureUrl,
      'isOnline': isOnline,
    };
  }
}

// Tanggal : 10 Juni 2025
// Nama : Muhammad Renaldi Maulana
// NIM : 10122002
// Kelas : IF-1
