import 'package:flutter/material.dart';
import 'package:project_uts_app/screens/login.dart';
import 'package:project_uts_app/screens/main_scaffold.dart';
import 'package:project_uts_app/screens/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/login', // Mulai dari halaman login
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScaffold(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
