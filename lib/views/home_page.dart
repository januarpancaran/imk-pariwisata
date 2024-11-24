import 'package:flutter/material.dart';
import 'reserve_page.dart';
import 'review_page.dart';
import '../utils/globals.dart';

class HomePage extends StatelessWidget {
  final PageController pageController;

  const HomePage({super.key, required this.pageController});

  Widget _buildActionButton(BuildContext context, String text, Widget iconWidget, VoidCallback onPressed) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.10,
            backgroundColor: Colors.blue.shade100,
            child: iconWidget,
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            text,
            style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      loggedInEmail == null
                          ? 'Halo, Pengguna'
                          : 'Halo, ${accountStorage[loggedInEmail!]?['name']}',
                      style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      DateTime.now().toLocal().toString().split(' ')[0],
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Image Banner
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  height: screenHeight * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/senja.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Pesona Pantai Marina',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: screenWidth * 0.08,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        shadows: const [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(1, 1),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // Action Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      context,
                      'Beli Tiket',
                      Image.asset(
                        'assets/images/ticket.png',
                        width: screenWidth * 0.09,
                        height: screenWidth * 0.09,
                      ),
                          () {
                        if (loggedInEmail == null) {
                          pageController.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 300), // Fixed from microseconds
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ReservePage()),
                          );
                        }
                      },
                    ),
                    _buildActionButton(
                      context,
                      'Ulasan',
                      Image.asset(
                        'assets/images/review.png',
                        width: screenWidth * 0.10,
                        height: screenWidth * 0.10,
                      ),
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReviewPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // Content Section
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pantai Marina",
                      style: TextStyle(fontSize: screenWidth * 0.075, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      height: screenHeight * 0.005,
                      width: screenWidth * 0.5,
                      color: Colors.blue.shade300,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Paragraph
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade50, Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(screenWidth * 0.04),
                          border: Border.all(color: Colors.blue.shade100, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(screenWidth * 0.05),
                        child: Text(
                          "Pantai Marina terletak di Jalan Marina Raya, Kota Semarang, hanya berjarak sekitar 6 kilometer dari Tugu Muda dan dekat dengan Pelabuhan Tanjung Mas serta Bandara Ahmad Yani.\n\nPantai ini menawarkan suasana tenang dengan ombak yang bersahabat, yang di mana ideal untuk bersantai, menikmati pemandangan, dan berbagai aktivitas seperti naik perahu, bermain jet ski, atau memancing. Selain itu, tersedia fasilitas lengkap seperti mushola, kamar mandi, ruang bilas, dan warung makan.\n\nPantai Marina buka setiap hari pukul 05.00-18.00 WIB dengan tiket masuk Rp 10.000.",
                          style: TextStyle(fontSize: screenWidth * 0.045, height: 1.8, color: Colors.black87),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
