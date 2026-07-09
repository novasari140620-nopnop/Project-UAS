// lib/main.dart

import 'package:flutter/material.dart';
// Hapus import ProgramView, ganti dengan HomeView
// import 'package:latihan_api/view/program/program_view.dart'; 
import 'package:uas/view/homePage.dart'; // <-- IMPORT BARU

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1A1A2E),
        cardColor: const Color(0xFF16213E),
      ),
      debugShowCheckedModeBanner: false,
      // Ganti home menjadi HomeView
      home: const HomeView(), // <-- UBAH DI SINI
    );
  }
}