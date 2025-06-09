import 'package:flutter/material.dart';

class GallerySkeleton extends StatelessWidget {
  const GallerySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 100, height: 18, color: Colors.grey[300]), // Judul
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              6,
              (index) =>
                  Container(width: 80, height: 80, color: Colors.grey[300]),
            ),
          ),
        ],
      ),
    );
  }
}
