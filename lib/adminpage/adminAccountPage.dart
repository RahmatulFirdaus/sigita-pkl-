import 'package:flutter/material.dart';

class Adminaccountpage extends StatefulWidget {
  const Adminaccountpage({super.key});

  @override
  State<Adminaccountpage> createState() => _AdminaccountpageState();
}

class _AdminaccountpageState extends State<Adminaccountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Admin Account")),
    );
  }
}