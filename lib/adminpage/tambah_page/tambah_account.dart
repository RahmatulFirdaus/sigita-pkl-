import 'package:flutter/material.dart';

class TambahAccount extends StatefulWidget {
  const TambahAccount({super.key});

  @override
  State<TambahAccount> createState() => _TambahAccountState();
}

class _TambahAccountState extends State<TambahAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Tambah Account")),
    );
  }
}