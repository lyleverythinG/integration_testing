import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_testing/authentication/auth_bloc/auth_bloc.dart';
import 'package:integration_testing/authentication/presentation/login_screen.dart';
import 'package:integration_testing/authentication/userdata_bloc/userdata_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            key: const Key('logoutButton'),
            onPressed: () {
              context.read<AuthBloc>().add(const LogoutEvent());
              context.read<UserDataBloc>().add(const UserDataDispose());
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (c) => const LoginScreen()));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text('Home Screen'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: const [
            Text('HomeScreen'),
          ],
        ),
      ),
    );
  }
}
