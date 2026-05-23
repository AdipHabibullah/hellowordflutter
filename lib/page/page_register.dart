import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_word/services/api_service.dart';
import 'package:http/http.dart' as http;

class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _namaLengkapController = TextEditingController();

  void register() async {
    if (_usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _namaLengkapController.text.isEmpty) {
      _showSnackBar("Semua field harus diisi");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(ApiService.urlRegister),
        body: {
          "username": _usernameController.text,
          "password": _passwordController.text,
          "email": _emailController.text,
          "fullname": _namaLengkapController.text,
        },
      );

      final data = jsonDecode(response.body);

      if (data["success"]) {
        _showSnackBar("Berhasil register");
        // kita arahkan ke halaman login
      } else {
        _showSnackBar("Gagal register");
      }
    } catch (e) {
      _showSnackBar('Terjadi kesalahan saat melakukan registrasi ${e}');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text("Halaman Register"),
      ),
    );
  }
}
