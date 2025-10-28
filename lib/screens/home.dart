import 'package:flutter/material.dart';
// import 'package:project_uts_app/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onNavigate;
  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Home'),
      body: SingleChildScrollView(
        child: Column(children: [_buildHeader(context), _buildBody(context)]),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xFF1E88E5),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 58.0, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 35,
                      width: 35,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            Navigator.pushNamed(context, '/settings');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hello,',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                const Text(
                  'ALYA.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Selamat dan semangat belajar hari ini!',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    const double cardGap = 8.0;
    const double cardHeightSmall = 150.0;
    const double cardHeightLarge = (cardHeightSmall * 2) + cardGap;

    return Transform.translate(
      offset: const Offset(0, 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kartu Materi (kiri)
                Expanded(
                  flex: 1,
                  child: _buildNavCard(
                    color: Colors.purple,
                    title: 'Materi',
                    subtitle:
                        'Kumpulan modul dan referensi belajar untuk kamu!',
                    height: cardHeightLarge,
                    onTap: () {
                      onNavigate(1);
                    },
                  ),
                ),
                const SizedBox(width: cardGap),
                // Kartu Project & Jurnal (kanan)
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      _buildNavCard(
                        color: Colors.blue,
                        title: 'Upload\nYour\nPROJECT!',
                        height: cardHeightSmall,
                        onTap: () {
                          onNavigate(3);
                        },
                      ),
                      const SizedBox(height: cardGap),
                      _buildNavCard(
                        color: Colors.red,
                        title: 'Jurnal',
                        height: cardHeightSmall,
                        onTap: () {
                          onNavigate(4);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble),
              label: const Text('Discussion Forum'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavCard({
    required Color color,
    required String title,
    String? subtitle,
    double? height,
    required VoidCallback onTap,
  }) {
    // Logika untuk perataan (alignment):
    // Rata tengah JIKA tidak ada subtitle DAN judul tidak mengandung newline (\n)
    bool isCentered = (subtitle == null && !title.contains('\n'));

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: height,
          width: double.infinity,
          child: Column(
            // Terapkan logika perataan
            crossAxisAlignment: isCentered
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            mainAxisAlignment: isCentered
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              Text(
                title,
                // Terapkan perataan teks
                textAlign: isCentered ? TextAlign.center : TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
