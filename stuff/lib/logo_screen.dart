import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png', // PNG instead of SVG
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
