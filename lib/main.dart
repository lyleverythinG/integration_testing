import 'package:flutter/material.dart';
import 'package:integration_testing/splash_screen/splash_screen.dart';

void main() {
  runApp(const IntegrationAppDemo());
}

class IntegrationAppDemo extends StatelessWidget {
  const IntegrationAppDemo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Integration Testing Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
