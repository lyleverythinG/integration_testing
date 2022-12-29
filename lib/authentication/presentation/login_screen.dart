import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_testing/authentication/presentation/register_screen.dart';
import 'package:integration_testing/authentication/reusable/loading.dart';
import 'package:integration_testing/authentication/reusable/no_acc_button.dart';
import 'package:integration_testing/home/presentation/home.dart';
import '../auth_bloc/auth_bloc.dart';
import '../userdata_bloc/userdata_bloc.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          if (mounted) {
            // login success
            context.read<UserDataBloc>().add(UserInit(uid: state.user.uid));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (c) => const HomeScreen()));
          }
        }
      },
      builder: (context, state) {
        if (state is AuthWaiting) {
          return const Loading();
        }
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: const Text('Login Screen')),
            body: SingleChildScrollView(
              child: Container(
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
                      key: const Key('emailLoginField'),
                      controller: emailCon,
                      decoration:
                          const InputDecoration(hintText: 'Enter Email'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      key: const Key('passwordLoginField'),
                      controller: passwordCon,
                      decoration:
                          const InputDecoration(hintText: 'Enter Password'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        key: const Key('loginButton'),
                        onPressed: () {
                          context.read<AuthBloc>().add(LoginEvent(
                              email: emailCon.text,
                              password: passwordCon.text));
                        },
                        child: const Text('LOGIN')),
                    const SizedBox(height: 20),
                    NoAccButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const RegisterScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
