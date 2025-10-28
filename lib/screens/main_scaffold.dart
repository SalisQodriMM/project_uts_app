import 'package:flutter/material.dart';
import 'package:project_uts_app/screens/home.dart';
import 'package:project_uts_app/screens/jurnal.dart';
import 'package:project_uts_app/screens/materi.dart';
import 'package:project_uts_app/screens/project.dart';
import 'package:project_uts_app/screens/tes.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = <Widget>[
      HomeScreen(onNavigate: _onItemTapped),
      const MateriScreen(),
      const TesScreen(),
      const ProjectsScreen(),
      const JurnalScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.blue[800],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
            _buildNavItem(icon: Icons.book, label: 'Materi', index: 1),
            _buildNavItem(icon: Icons.edit, label: 'Tes', index: 2),
            _buildNavItem(icon: Icons.add, label: 'Projects', index: 3),
            _buildNavItem(icon: Icons.article, label: 'Jurnal', index: 4),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk membuat satu item navigasi
  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    // Cek apakah item ini sedang aktif
    final bool isActive = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white
              : Colors.transparent, // Latar belakang "pil"
          borderRadius: BorderRadius.circular(30), // Bentuk "pil"
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              // Warna ikon: biru jika aktif, putih jika tidak
              color: isActive ? Colors.blue[800] : Colors.white,
            ),
            // Hanya tampilkan teks jika sedang aktif
            if (isActive) const SizedBox(width: 8),
            if (isActive)
              SizedBox(
                width: 70,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
