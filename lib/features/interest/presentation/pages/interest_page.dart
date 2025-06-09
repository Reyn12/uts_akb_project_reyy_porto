import 'package:flutter/material.dart';

class InterestPage extends StatelessWidget {
  const InterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data kategori minat
    final List<InterestCategory> categories = [
      InterestCategory(
        title: 'Teknologi',
        icon: Icons.computer,
        color: Colors.blue,
        items: [
          InterestItem(
            title: 'Flutter',
            description:
                'Framework UI untuk membuat aplikasi mobile, web, dan desktop',
            imageUrl:
                'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          ),
          InterestItem(
            title: 'Mobile Development',
            description: 'Pengembangan aplikasi mobile untuk Android dan iOS',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/2586/2586488.png',
          ),
          InterestItem(
            title: 'UI/UX Design',
            description: 'Desain antarmuka pengguna dan pengalaman pengguna',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/5278/5278655.png',
          ),
        ],
      ),
      InterestCategory(
        title: 'Hobi',
        icon: Icons.sports_basketball,
        color: Colors.orange,
        items: [
          InterestItem(
            title: 'Fotografi',
            description: 'Mengambil foto pemandangan dan street photography',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/1042/1042339.png',
          ),
          InterestItem(
            title: 'Musik',
            description: 'Mendengarkan dan memainkan alat musik',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/3659/3659784.png',
          ),
        ],
      ),
      InterestCategory(
        title: 'Belajar',
        icon: Icons.school,
        color: Colors.green,
        items: [
          InterestItem(
            title: 'Bahasa Pemrograman',
            description: 'Mempelajari berbagai bahasa pemrograman',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/6062/6062646.png',
          ),
          InterestItem(
            title: 'Artificial Intelligence',
            description: 'Mempelajari tentang AI dan machine learning',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/2103/2103633.png',
          ),
          InterestItem(
            title: 'Cloud Computing',
            description: 'Mempelajari teknologi cloud dan implementasinya',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/4336/4336029.png',
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minat & Hobi'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategorySection(categories[index]);
        },
      ),
    );
  }

  Widget _buildCategorySection(InterestCategory category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header kategori
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: category.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(category.icon, color: category.color, size: 24),
            ),
            const SizedBox(width: 12),
            Text(
              category.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Item minat dalam kategori
        ...category.items.map((item) => _buildInterestItem(item)).toList(),

        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildInterestItem(InterestItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),

            // Informasi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
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

// Model untuk kategori minat
class InterestCategory {
  final String title;
  final IconData icon;
  final Color color;
  final List<InterestItem> items;

  InterestCategory({
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
  });
}

// Model untuk item minat
class InterestItem {
  final String title;
  final String description;
  final String imageUrl;

  InterestItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
