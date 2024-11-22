import 'package:flutter/material.dart';
import 'photos_page.dart';
import 'reserve_page.dart';
import 'review_page.dart';
import '../utils/globals.dart';

class HomePage extends StatelessWidget {
  final PageController pageController;
  const HomePage({super.key, required this.pageController});

  Widget _buildActionButton(BuildContext context, String text, IconData icon, VoidCallback onPressed) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onPressed,
        child: Container(
          width: 180,
          height: 120,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.black54),
              const SizedBox(height: 4),
              Text(
                text,
                style: const TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 60),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  child: const Center(
                    child: Text(
                      'Pantai Marina',
                      style: TextStyle(fontSize: 40, color: Colors.black54),
                    ),
                  ),
                ),
              ),

              // Photos
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.0),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const PhotosPage(),
                    ));
                  },
                  child: Container(
                    width: 380,
                    height: 350,
                    margin: const EdgeInsets.only(bottom: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12.0),
                          ),
                          child: Image.asset(
                            'assets/images/senja.jpeg',
                            width: double.infinity,
                            height: 280,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Mengenal Lebih Dekat',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Action Buttons
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildActionButton(context, 'Beli Tiket', Icons.airplane_ticket, () {
                      if (loggedInEmail == null) {
                        pageController.animateToPage(
                          2,
                          duration: const Duration(microseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const ReservePage(),
                        ));
                      }
                    }),
                    _buildActionButton(context, 'Apa Kata Orang?', Icons.chat, () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const ReviewPage(),
                      ));
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}