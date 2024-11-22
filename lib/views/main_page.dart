import 'package:flutter/material.dart';
import 'home_page.dart';
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

  int _selectedIndex = 1;

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
    _pageController = PageController(initialPage: 1);
    _pages = [
      const MyTicketPage(),
      HomePage(pageController: _pageController),
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
        items: const [
          // Ticket Icon
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Tiket Saya',
          ),

          // Home Icon
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),

          // Account Icon
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
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