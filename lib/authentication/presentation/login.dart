import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Image.asset("assets/flutter_logo.png"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailCon,
                decoration: const InputDecoration(hintText: 'Enter Email'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: passwordCon,
                decoration: const InputDecoration(hintText: 'Enter Password'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(onPressed: () {}, child: const Text('LOGIN')),
            ],
          ),
        ),
      ),
    );
  }
}
