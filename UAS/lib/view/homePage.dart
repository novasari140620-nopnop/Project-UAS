// lib/homePage.dart

import 'package:flutter/material.dart';
import 'package:uas/view/profile.dart';
import 'package:uas/view/data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProgramView(), // Halaman daftar user (API ReqRes)
    ProfileView(), // Halaman profil developer
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Color.fromARGB(255, 233, 230, 230), // Warna teks dan icon AppBar
          backgroundColor: Colors.white, // Background AppBar (opsional)
          elevation: 1, // Shadow AppBar (opsional)
        ),
        // Pastikan teks menggunakan warna hitam
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Colors.black),
          titleSmall: TextStyle(color: Colors.black),
        ),
        // Set primary text color
        primaryTextTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          bodySmall: TextStyle(color: Colors.black),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'User',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 108, 120, 189),
          unselectedItemColor: const Color.fromARGB(255, 238, 234, 234),
          onTap: _onItemTapped,
          backgroundColor: const Color.fromARGB(255, 56, 76, 136),
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}