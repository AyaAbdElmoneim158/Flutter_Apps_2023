import 'package:flutter/material.dart';

class BottomBarScreen extends StatelessWidget {
  static const String routeName = '/BottomBar';
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("BottomBarScreen")),
    );
  }
}
