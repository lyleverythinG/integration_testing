import 'package:flutter/material.dart';
import 'package:integration_testing/authentication/presentation/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailCon = TextEditingController();
  final passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            titleSpacing: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (c) => const LoginScreen()));
              },
            ),
            title: const Text('Register Screen')),
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
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text('REGISTER')),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
