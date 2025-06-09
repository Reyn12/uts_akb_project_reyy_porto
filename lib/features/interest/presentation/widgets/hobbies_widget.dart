import 'package:flutter/material.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/hobby_entitiy.dart';

class Hobbies extends StatelessWidget {
  final List<HobbyEntity> hobbies;
  final bool isLoading;

  const Hobbies({super.key, required this.hobbies, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (hobbies.isEmpty)
            const Center(child: Text('No hobbies found'))
          else
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.blue[100], // Warna biru muda
                          shape: BoxShape.circle, // Bentuk lingkaran
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.blue[900],
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Hobbies',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        hobbies.map((hobby) {
                          return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            child: Text(
                              hobby.title,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
