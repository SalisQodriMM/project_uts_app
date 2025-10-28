import 'package:flutter/material.dart';
import 'package:project_uts_app/widgets/app_bar.dart';

class MateriScreen extends StatelessWidget {
  const MateriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Materi'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildSemesterCard(
              title: 'Semester 1',
              subtitle: '9 mata kuliah',
              color: Colors.yellow[700]!,
            ),
            _buildSemesterCard(
              title: 'Semester 2',
              subtitle: '9 mata kuliah',
              color: Colors.red[600]!,
            ),
            _buildSemesterCard(
              title: 'Semester 3',
              subtitle: '9 mata kuliah',
              color: Colors.green[600]!,
            ),
            _buildSemesterCard(
              title: 'Semester 4',
              subtitle: '9 mata kuliah',
              color: Colors.blue[700]!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSemesterCard({
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
