import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_testing/authentication/presentation/login_screen.dart';
import 'package:integration_testing/authentication/repository/auth_repo.dart';
import 'authentication/auth_bloc/auth_bloc.dart';
import 'authentication/repository/userdata_repo.dart';
import 'authentication/userdata_bloc/userdata_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const IntegrationAppDemo());
}

class IntegrationAppDemo extends StatelessWidget {
  const IntegrationAppDemo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: ((context) => AuthRepo())),
        RepositoryProvider(create: ((context) => UserDataRepo())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepo: RepositoryProvider.of<AuthRepo>(context))),
          BlocProvider(
              create: (context) => UserDataBloc(
                  userDataRepo: RepositoryProvider.of<UserDataRepo>(context))),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Integration Testing Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
