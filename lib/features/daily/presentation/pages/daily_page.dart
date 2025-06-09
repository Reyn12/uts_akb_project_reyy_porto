import 'package:flutter/material.dart';

class DailyPage extends StatelessWidget {
  const DailyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data aktivitas harian (dummy data)
    final List<DailyActivity> activities = [
      DailyActivity(
        title: 'Belajar Flutter',
        time: '08:00 - 10:00',
        description: 'Mempelajari state management dengan GetX',
        isCompleted: true,
      ),
      DailyActivity(
        title: 'Meeting dengan Tim',
        time: '10:30 - 12:00',
        description: 'Diskusi tentang fitur baru aplikasi',
        isCompleted: true,
      ),
      DailyActivity(
        title: 'Makan Siang',
        time: '12:00 - 13:00',
        description: 'Istirahat dan makan siang',
        isCompleted: true,
      ),
      DailyActivity(
        title: 'Coding Session',
        time: '13:00 - 16:00',
        description: 'Implementasi fitur baru',
        isCompleted: false,
      ),
      DailyActivity(
        title: 'Review Kode',
        time: '16:00 - 17:00',
        description: 'Review kode dengan senior developer',
        isCompleted: false,
      ),
      DailyActivity(
        title: 'Olahraga',
        time: '18:00 - 19:00',
        description: 'Jogging di taman',
        isCompleted: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktivitas Harian'),
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              // Implementasi untuk membuka kalender
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header tanggal
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.blue.withValues(alpha: 0.1),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Hari ini',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getCurrentDate(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Progress hari ini
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Progress Hari Ini',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: _calculateProgress(activities),
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(height: 8),
                Text(
                  '${(_calculateProgress(activities) * 100).toInt()}% Selesai',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          // Daftar aktivitas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                return _buildActivityCard(activities[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementasi untuk menambah aktivitas baru
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  // Mendapatkan tanggal saat ini dalam format yang diinginkan
  String _getCurrentDate() {
    final now = DateTime.now();
    final months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    final days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];

    // Perhatikan bahwa weekday di Dart dimulai dari 1 (Senin) hingga 7 (Minggu)
    final dayName = days[now.weekday - 1];
    final monthName = months[now.month - 1];

    return '$dayName, ${now.day} $monthName ${now.year}';
  }

  // Menghitung progress berdasarkan aktivitas yang sudah selesai
  double _calculateProgress(List<DailyActivity> activities) {
    if (activities.isEmpty) return 0.0;

    final completedActivities =
        activities.where((activity) => activity.isCompleted).length;
    return completedActivities / activities.length;
  }

  // Widget untuk menampilkan kartu aktivitas
  Widget _buildActivityCard(DailyActivity activity) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Indikator status (selesai/belum)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    activity.isCompleted ? Colors.green : Colors.grey.shade300,
                border: Border.all(
                  color:
                      activity.isCompleted
                          ? Colors.green.shade700
                          : Colors.grey,
                  width: 2,
                ),
              ),
              child:
                  activity.isCompleted
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
            ),
            const SizedBox(width: 16),
            // Informasi aktivitas
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        activity.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration:
                              activity.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                          color:
                              activity.isCompleted ? Colors.grey : Colors.black,
                        ),
                      ),
                      Text(
                        activity.time,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    activity.description,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          activity.isCompleted ? Colors.grey : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model untuk aktivitas harian
class DailyActivity {
  final String title;
  final String time;
  final String description;
  final bool isCompleted;

  DailyActivity({
    required this.title,
    required this.time,
    required this.description,
    required this.isCompleted,
  });
}
