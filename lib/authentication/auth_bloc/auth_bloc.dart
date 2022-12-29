import '../../common_packages/common_packages.dart';
import 'dart:developer' as developer;
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc({required this.authRepo}) : super(AuthInitial()) {
    on<CheckForLoginUsers>((event, emit) {
      developer.log('Checking for Logged In Users', name: 'AuthBlocEvent');
      if (authRepo.auth.currentUser != null) {
        emit(AuthSuccess(user: authRepo.auth.currentUser!));
      } else {
        emit(NoLoginUser());
      }
    });

    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthWaiting());
        developer.log("${event.email} ${event.password}", name: 'LoginDetails');
        await authRepo
            .signInWithEmailPassword(
                email: event.email, password: event.password)
            .then((user) {
          if (user != null) {
            add(LoginSuccessful(user: user));
          }
        });
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.message.toString());
        emit(NoLoginUser());
      }
    });

    on<LoginSuccessful>((event, emit) {
      emit(AuthSuccess(user: event.user));
    });

    on<RegisterUserEvent>((event, emit) async {
      try {
        emit(AuthWaiting());
        await authRepo
            .createUserWithEmailAndPassword(
                email: event.email, password: event.password)
            .then((user) {
          if (user != null) {
            add(
              AccountCreated(
                user: user,
                userData: UserModel(
                    email: event.email,
                    uid: user.uid,
                    accountCreated: event.accountCreated),
                password: event.password,
              ),
            );
          }
        });
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.message.toString());
        emit(NoLoginUser());
      }
    });

    on<AccountCreated>((event, emit) async {
      try {
        await authRepo
            .signInWithEmailPassword(
                email: event.userData.email, password: event.password)
            .then((user) {
          if (user != null) {
            add(AddUserDataToDB(
              uid: event.userData.uid,
              userData: event.userData,
            ));
          }
        });
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    });

    on<AddUserDataToDB>((event, emit) async {
      try {
        await UserModel(
                email: event.userData.email,
                uid: event.userData.uid,
                accountCreated: event.userData.accountCreated)
            .commit()
            .then((user) {
          if (user == true) {
            emit(AuthSuccess(user: FirebaseAuth.instance.currentUser!));
          }
        });
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        await authRepo.auth.signOut();
        Fluttertoast.showToast(msg: 'successfully logged out');
        emit(NoLoginUser());
      } catch (e) {
        developer.log('$e', name: 'LogoutError');
      }
    });
  }
}
