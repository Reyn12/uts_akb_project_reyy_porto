import 'package:flutter/material.dart';

class StatsCardSkeleton extends StatelessWidget {
  const StatsCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Skeleton kotak 1
          Container(
            width: 120,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(width: 40, height: 28, color: Colors.grey[300]),
                SizedBox(height: 8),
                Container(width: 60, height: 14, color: Colors.grey[300]),
              ],
            ),
          ),
          // Skeleton kotak 2
          Container(
            width: 120,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(width: 40, height: 28, color: Colors.grey[300]),
                SizedBox(height: 8),
                Container(width: 60, height: 14, color: Colors.grey[300]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
