class FriendEntity {
  final String name;
  final String? profilePictureUrl;
  final bool isOnline;

  FriendEntity({
    required this.name,
    this.profilePictureUrl,
    required this.isOnline,
  });
}
