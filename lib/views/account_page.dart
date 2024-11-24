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
  Widget _elevatedButton(VoidCallback onPress, String text, {Color? buttonColor}) {
    final screenWidth = MediaQuery.of(context).size.width;

    final textColor = (buttonColor ?? Colors.white).computeLuminance() > 0.5 ? Theme.of(context).primaryColor : Colors.white;

    return SizedBox(
      width: screenWidth * 0.8,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Colors.white,
          textStyle: const TextStyle(fontSize: 24),
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        child: Text(text),
      ),
    );
  }

  void _changeName() {
    TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ubah Nama'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Masukkan Nama Baru'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                String newName = nameController.text.trim();
                if (newName.isNotEmpty) {
                  setState(() {
                    accountStorage[loggedInEmail!]?['name'] = newName;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nama berhasil diperbarui')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nama tidak boleh kosong')),
                  );
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _changePassword() {
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ubah Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Masukkan Password Baru'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Konfirmasi Password Baru'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                String newPassword = passwordController.text.trim();
                String confirmPassword = confirmPasswordController.text.trim();
                if (newPassword.isEmpty || confirmPassword.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password tidak boleh kosong')),
                  );
                } else if (newPassword != confirmPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password tidak cocok')),
                  );
                } else {
                  setState(() {
                    accountStorage[loggedInEmail!]?['password'] = newPassword;
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password berhasil diperbarui')),
                  );
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
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
                  },
                  'Masuk'),
              const SizedBox(height: 25),
              _elevatedButton(
                      () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ));
                  },
                  'Buat Akun'),
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
              // Change Name
              _elevatedButton(
                  _changeName, 'Ubah Nama'),
              const SizedBox(height: 16),
              // Change Password
              _elevatedButton(
                  _changePassword, 'Ubah Password'),
              const SizedBox(height: 16),
              // Logout
              _elevatedButton(
                      () {
                    setState(() {
                      loggedInEmail = null;
                    });
                  },
                  'Logout',
                buttonColor: Colors.red.shade500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
