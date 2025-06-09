class UserProfileEntity {
  final String name;
  final String role;
  final double rating;
  final int projects;
  final int friends;
  final int photos;
  final String? profilePictureUrl;
  final bool isOnline;

  UserProfileEntity({
    required this.name,
    required this.role,
    required this.rating,
    required this.projects,
    required this.friends,
    required this.photos,
    this.profilePictureUrl,
    required this.isOnline,
  });
}
