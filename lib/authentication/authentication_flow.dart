import 'dart:developer' as developer;
import '../common_packages/common_packages.dart';

class AuthenticationFlow extends StatefulWidget {
  const AuthenticationFlow({Key? key}) : super(key: key);

  @override
  State<AuthenticationFlow> createState() => _AuthenticationFlowState();
}

class _AuthenticationFlowState extends State<AuthenticationFlow> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        //if no logged in User
        if (state is NoLoginUser) {
          if (mounted) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (c) => const LoginScreen()));
          }
        }
        if (state is AuthSuccess) {
          //if successfully logged in
          developer.log('Successfully Logged In State', name: 'AuthBlocState');
          if (mounted) {
            context.read<UserDataBloc>().add(UserInit(uid: state.user.uid));
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (c) => const HomeScreen()));
          }
        }
      },
      builder: (context, state) {
        if (state is AuthInitial) {
          developer.log('AuthInitial State', name: 'AuthBlocState');
          context.read<AuthBloc>().add(CheckForLoginUsers());
        }

        return const Loading();
      },
    );
  }
}
