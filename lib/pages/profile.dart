import 'package:flutter/material.dart';
import 'package:sigita_test/drawerNav/drawerNavigasi.dart';
import 'package:sigita_test/navigasi/navigasiBar.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navigasibar(),
      drawer: const Drawernavigasi(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
             Colors.white,
              Color.fromRGBO(202, 248, 253, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,)
        ),
        child: const Center(
          child: Text("Profile"),
          ),
      )
    );
  }
}