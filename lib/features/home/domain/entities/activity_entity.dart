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

// Tanggal : 09 Juni 2025
// Nama : Muhammad Renaldi Maulana
// NIM : 10122002
// Kelas : IF-1
