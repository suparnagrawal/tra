import 'dart:async';
import 'package:flutter/material.dart';
import 'logo_screen.dart';
import 'login_screen.dart';

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper>
    with SingleTickerProviderStateMixin {
  late final Widget _loginScreen;
  late final Widget _logoScreen;
  late final AnimationController _controller;
  late final Animation<double> _anim;
  Timer? _timer;
  bool _animCompleted = false;

  @override
  void initState() {
    super.initState();

    // preload screens (give them distinct keys so they are unique)
    _loginScreen = const LoginScreen(key: ValueKey('login'));
    _logoScreen = const LogoScreen(key: ValueKey('logo'));

    // animation controller for fade
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _anim = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => _animCompleted = true);
      }
    });

    // show logo for 3s, then start fade
    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Login screen fades in. IgnorePointer prevents taps while hidden.
          IgnorePointer(
            ignoring: !_animCompleted,
            child: FadeTransition(
              opacity: _anim,
              child: _loginScreen,
            ),
          ),

          // Logo screen fades out (reverse of the same animation)
          FadeTransition(
            opacity: ReverseAnimation(_anim),
            child: _logoScreen,
          ),
        ],
      ),
    );
  }
}
