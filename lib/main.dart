import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

// HomePage Start
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 80),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PhotosPage(),
                  )
                );
              },
              child: Container(
                width: 380,
                height: 350,
                margin: const EdgeInsets.only(bottom: 4.0),
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
                  children: <Widget>[
                    // Full-width Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12.0),
                      ),
                      child: Image.network(
                        'https://via.placeholder.com/350x150',
                        width: double.infinity,
                        height: 280,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Text
                    const Text(
                      'Mengenal Lebih Dekat',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReservePage(),
                      ),
                    );
                  },
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
                            offset: const Offset(0, 3)
                        )
                      ],
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.airplane_ticket, size: 50, color: Colors.black54),
                        SizedBox(height: 4),
                        Text(
                          'Beli Tiket',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReviewPage(),
                      ),
                    );
                  },
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
                        )
                      ],
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.chat, size: 50, color: Colors.black54),
                        SizedBox(height: 4),
                        Text(
                          'Apa Kata Orang?',
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Footer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.airplane_ticket, size: 30, color: Colors.black54),
                  onPressed: () {
                    const Text('PlaceHolder');
                  },
                  tooltip: 'Tiket Saya',
                ),

                IconButton(
                  icon: const Icon(Icons.home, size: 30, color: Colors.black54),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const HomePage()
                    ));
                  },
                ),
                
                IconButton(
                  icon: const Icon(Icons.person, size: 30, color: Colors.black54),
                  onPressed: () {
                    const Text('PlaceHolder');
                  },
                  tooltip: 'Akun Saya',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
// HomePage End

// PhotosPage Start
class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mengenal Lebih Dekat'),
      ),
    );
  }
}
// PhotosPage End

// ReservePage Start
class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beli Tiket'),
      ),
    );
  }
}
// ReservePage End

// ReviewPage Start
class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apa Kata Orang?'),
      ),
    );
  }
}
// ReviewPage End