import 'package:flutter/material.dart';

class GoalsSkeleton extends StatelessWidget {
  const GoalsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 100, height: 18, color: Colors.grey[300]), // Judul
          SizedBox(height: 16),
          ...List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Container(height: 16, color: Colors.grey[300]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
