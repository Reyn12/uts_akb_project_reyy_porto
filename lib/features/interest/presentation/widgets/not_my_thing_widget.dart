import 'package:flutter/material.dart';
import 'package:uts_akb_project_reyy_portfo/features/interest/domain/entities/not_my_love_entity.dart';

class NotMyThing extends StatelessWidget {
  final List<NotMyLoveEntity> notMyLove;
  final bool isLoading;

  const NotMyThing({
    super.key,
    required this.notMyLove,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (notMyLove.isEmpty)
            const Center(child: Text('No things i love found'))
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
                          Icons.not_interested,
                          color: Colors.blue[900],
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Not My Things',
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
                        notMyLove.map((notMyLove) {
                          return ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                color: Color.fromARGB(255, 199, 43, 43),
                              ),
                              backgroundColor: const Color.fromARGB(
                                255,
                                228,
                                207,
                                202,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            child: Text(
                              notMyLove.title,
                              style: TextStyle(color: Colors.red[900]),
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
