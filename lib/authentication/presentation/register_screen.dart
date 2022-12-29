import '../../common_packages/common_packages.dart';

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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: ((context, state) {
        if (state is AuthSuccess) {
          if (mounted) {
            context.read<UserDataBloc>().add(UserInit(uid: state.user.uid));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (c) => const HomeScreen()));
          }
        }
      }),
      builder: (context, state) {
        if (state is AuthWaiting) {
          return const Loading();
        }
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                      controller: emailCon,
                      decoration:
                          const InputDecoration(hintText: 'Enter Email'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordCon,
                      decoration:
                          const InputDecoration(hintText: 'Enter Password'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(RegisterUserEvent(
                              email: emailCon.text,
                              accountCreated: DateTime.now(),
                              password: passwordCon.text));
                        },
                        child: const Text('REGISTER')),
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
