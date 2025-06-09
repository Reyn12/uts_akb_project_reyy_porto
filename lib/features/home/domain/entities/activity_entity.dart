enum ActivityStatus { done, ongoing, upcoming }

class ActivityEntity {
  final String title;
  final String time; // Bisa DateTime juga kalau mau
  final String? iconUrl;
  final ActivityStatus status;

  ActivityEntity({
    required this.title,
    required this.time,
    this.iconUrl,
    required this.status,
  });
}
