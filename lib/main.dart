import 'package:flutter/material.dart';
import 'package:flutter_application_003/views/home/welcome_page.dart';
import '/views/auth/login_page.dart'; // Pastikan untuk mengimpor LoginPage
import '/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Status mode gelap
  ThemeMode _themeMode = ThemeMode.system;

  // Fungsi untuk toggle antara light mode dan dark mode
  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme, // Tema Light
      darkTheme: AppTheme.darkTheme, // Tema Dark
      themeMode: _themeMode, // Gunakan theme mode dinamis
      home: LoginPage(), // Jadikan LoginPage sebagai halaman utama
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/welcome': (context) => WelcomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
