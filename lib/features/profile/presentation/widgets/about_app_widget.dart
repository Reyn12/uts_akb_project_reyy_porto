import 'package:flutter/material.dart';

class AboutAppWidget extends StatelessWidget {
  final String version;
  final String developer;
  final String releaseYear;
  final String description;

  const AboutAppWidget({
    Key? key,
    this.version = '1.0.0',
    this.developer = 'Muhammad Renaldi',
    this.releaseYear = '2024',
    this.description =
        'Modern personal profile application designed to showcase daily activities, interests, and connect with friends in a beautiful, intuitive interface.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => _showAboutDialog(context),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue[800]),
              const SizedBox(width: 12),
              const Text(
                'About App',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text(
              'About Application',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('Version:', version),
                const SizedBox(height: 8),
                _buildInfoRow('Developer:', developer),
                const SizedBox(height: 8),
                _buildInfoRow('Release:', releaseYear),
                const SizedBox(height: 16),
                Text(description, style: const TextStyle(fontSize: 14)),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(width: 8),
        Text(value),
      ],
    );
  }
}
