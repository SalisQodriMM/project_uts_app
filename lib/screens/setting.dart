import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Info Profil
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'Alya',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Alya@Example.Com',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 30),

            // Menu Pengaturan
            _buildSettingsItemWithSwitch(
              title: 'Dark Theme',
              icon: Icons.dark_mode,
              value: _isDarkTheme,
              onChanged: (val) {
                setState(() {
                  _isDarkTheme = val;
                });
              },
            ),
            _buildSettingsItem(
              title: 'Notifications',
              icon: Icons.notifications,
              onTap: () {},
            ),
            _buildSettingsItem(
              title: 'Security',
              icon: Icons.security,
              onTap: () {},
            ),
            _buildSettingsItem(
              title: 'My Projects',
              icon: Icons.bookmark,
              onTap: () {},
            ),
            _buildSettingsItem(
              title: 'About SakTI',
              icon: Icons.info,
              onTap: () {},
            ),

            const Spacer(),

            // Tombol Log Out
            ElevatedButton(
              onPressed: () {
                // Kembali ke login dan hapus semua halaman sebelumnya
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 15),
            Text(title, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItemWithSwitch({
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: () => onChanged(!value),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[700],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 7,
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 15),
            Text(title, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: Colors.white,
              activeTrackColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
