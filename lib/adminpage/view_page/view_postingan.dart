import 'package:flutter/material.dart';

class ViewPostinganPage extends StatefulWidget {
  String id;
  ViewPostinganPage({super.key, required this.id});

  @override
  State<ViewPostinganPage> createState() => _ViewPostinganPageState();
}

class _ViewPostinganPageState extends State<ViewPostinganPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("View Postingan")),
    );
  }
}