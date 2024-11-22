import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';
import '../utils/globals.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Widget _elevatedButton(VoidCallback onPress, String text) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.8,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 24),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // If Not Logged In
    if (loggedInEmail == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Kamu Belum Login',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              _elevatedButton(
                  () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    )).then((_) => setState(() {}));
                  }, 'Masuk',
              ),
              const SizedBox(height: 25),
              _elevatedButton(
                  () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ));
                  }, 'Buat Akun',
              ),
            ],
          ),
        ),
      );
    }

    // If Logged In
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.person, size: 50),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${accountStorage[loggedInEmail!]?['name']}',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$loggedInEmail',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Change Password
              _elevatedButton(
                  () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fitur Belum Tersedia')),
                    );
                  }, 'Ubah Password',
              ),
              const SizedBox(height: 16),
              // Logout
              _elevatedButton(
                  () {
                    setState(() {
                      loggedInEmail = null;
                    });
                  }, 'Logout',
              ),
            ],
          ),
        ),
      ),
    );
  }
}