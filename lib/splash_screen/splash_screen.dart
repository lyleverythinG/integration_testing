import 'dart:async';
import 'package:flutter/material.dart';
import 'package:integration_testing/authentication/presentation/login_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 5), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => const LoginScreen()));
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: LottieBuilder.asset(
            'assets/splash_screen.json',
            repeat: false,
          ),
        ),
      ),
    );
  }
}
