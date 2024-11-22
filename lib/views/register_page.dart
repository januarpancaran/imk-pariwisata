import 'package:flutter/material.dart';
import '../utils/globals.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final name = _nameController.text;

      if (accountStorage.containsKey(email)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email sudah terdaftar!')),
        );
      } else {
        accountStorage[email] = {
          'name': name,
          'password': password,
        };
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registrasi berhasil!')),
        );
        Navigator.pop(context);
      }
    }
  }

  Widget _inputField(TextEditingController textController, String text) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(labelText: text),
      obscureText: (text == 'Password' || text == 'Konfirmasi Password') ? true : false,
      validator: (value) {
        if (text == 'Konfirmasi Password') {
          if (value != _passwordController.text) {
            return 'Password tidak sama!';
          }
        }

        if (value == null || value.isEmpty) {
          return '$text tidak boleh kosong!';
        }
        return null;
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Akun'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _inputField(_nameController, 'Nama'),
              _inputField(_emailController, 'Email'),
              _inputField(_passwordController, 'Password'),
              _inputField(_confirmPasswordController, 'Konfirmasi Password'),

              const SizedBox(height: 20),
              ElevatedButton(onPressed: _register, child: const Text('Daftar')),
            ],
          ),
        ),
      ),
    );
  }
}