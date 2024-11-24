import 'package:flutter/material.dart';
import 'home_page.dart';
import 'photos_page.dart';
import 'account_page.dart';
import 'my_ticket_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  late List<Widget> _pages;

  int _selectedIndex = 0;

  void _onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTap(int selectedIndex) {
    _pageController.animateToPage(
      selectedIndex,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pages = [
      HomePage(pageController: _pageController),
      const PhotosPage(),
      const MyTicketPage(),
      const AccountPage(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        type: BottomNavigationBarType.fixed,
        items: [
          // Home Icon
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24,
              height: 24,
            ),
            label: 'Beranda',
          ),

          // Explore Icon
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/images.png',
              width: 24,
              height: 24,
            ),
            label: 'Galeri',
          ),

          // Ticket Icon
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/ticket.png',
              width: 24,
              height: 24,
            ),
            label: 'Tiket Saya',
          ),

          // Account Icon
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/profile.png',
              width: 24,
              height: 24,
            ),
            label: 'Akun Saya',
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChange,
        children: _pages,
      ),
    );
  }
}