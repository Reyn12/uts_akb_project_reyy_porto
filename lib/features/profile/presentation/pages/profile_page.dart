import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Implementasi untuk membuka pengaturan
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header profil dengan foto dan nama
            _buildProfileHeader(),

            // Informasi kontak
            _buildInfoSection('Informasi Kontak', [
              InfoItem(
                icon: Icons.email,
                title: 'Email',
                value: 'reyy@example.com',
              ),
              InfoItem(
                icon: Icons.phone,
                title: 'Telepon',
                value: '+62 812 3456 7890',
              ),
              InfoItem(
                icon: Icons.location_on,
                title: 'Lokasi',
                value: 'Jakarta, Indonesia',
              ),
            ]),

            // Pendidikan
            _buildInfoSection('Pendidikan', [
              InfoItem(
                icon: Icons.school,
                title: 'Universitas Indonesia',
                value: 'Teknik Informatika (2019 - 2023)',
              ),
              InfoItem(
                icon: Icons.school,
                title: 'SMA Negeri 1 Jakarta',
                value: 'IPA (2016 - 2019)',
              ),
            ]),

            // Pengalaman kerja
            _buildInfoSection('Pengalaman Kerja', [
              InfoItem(
                icon: Icons.work,
                title: 'Mobile Developer',
                value: 'PT. Tech Indonesia (2023 - Sekarang)',
              ),
              InfoItem(
                icon: Icons.work,
                title: 'Intern Mobile Developer',
                value: 'Startup XYZ (2022 - 2023)',
              ),
            ]),

            // Sertifikasi
            _buildInfoSection('Sertifikasi', [
              InfoItem(
                icon: Icons.verified,
                title: 'Flutter Development Bootcamp',
                value: 'Google Developer (2022)',
              ),
              InfoItem(
                icon: Icons.verified,
                title: 'Mobile App Development',
                value: 'Dicoding Indonesia (2021)',
              ),
            ]),

            // Media sosial
            _buildSocialMediaSection(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget untuk header profil
  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Foto profil
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 16),
          // Nama
          const Text(
            'Reyy',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          // Jabatan
          const Text(
            'Mobile Developer',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 16),
          // Status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Available for Freelance',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk section informasi
  Widget _buildInfoSection(String title, List<InfoItem> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul section
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Item informasi
          ...items.map((item) => _buildInfoItem(item)).toList(),
        ],
      ),
    );
  }

  // Widget untuk item informasi
  Widget _buildInfoItem(InfoItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(item.icon, size: 20, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.value,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk section media sosial
  Widget _buildSocialMediaSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Media Sosial',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSocialButton(Icons.language, 'Website'),
              _buildSocialButton(Icons.facebook, 'Facebook'),
              _buildSocialButton(Icons.camera_alt, 'Instagram'),
              _buildSocialButton(Icons.link, 'LinkedIn'),
            ],
          ),
        ],
      ),
    );
  }

  // Widget untuk tombol media sosial
  Widget _buildSocialButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

// Model untuk item informasi
class InfoItem {
  final IconData icon;
  final String title;
  final String value;

  InfoItem({required this.icon, required this.title, required this.value});
}
