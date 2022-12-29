import 'common_packages/common_packages.dart';

Future<void> main() async {
  //TODO: setup Firebase(Ex.Firebase,authentication-enable email & password, setup firestore database)
  //TODO: android\app\build.gradle ERROR FIX: Changed GradleException() into -> FileNotFoundException()
  //TODO: android\app\build.gradle - minSdkVersion - 21, targetSdkVersion - 30
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
