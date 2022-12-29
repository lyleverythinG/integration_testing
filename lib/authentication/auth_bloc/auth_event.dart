part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class CheckForLoginUsers extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

class LoginError extends AuthEvent {
  final String message;
  const LoginError({required this.message});
  @override
  List<Object> get props => [message];
}

class LogoutEvent extends AuthEvent {
  const LogoutEvent();
  @override
  List<Object> get props => [];
}

class LoginSuccessful extends AuthEvent {
  final User user;
  const LoginSuccessful({required this.user});
  @override
  List<Object> get props => [user];
}

class AccountCreated extends AuthEvent {
  final User user;
  final UserModel userData;
  final String password;
  const AccountCreated(
      {required this.password, required this.userData, required this.user});
  @override
  List<Object> get props => [user, userData, password];
}

class AddUserDataToDB extends AuthEvent {
  final UserModel userData;
  final String uid;
  const AddUserDataToDB({required this.uid, required this.userData});
  @override
  List<Object> get props => [userData, uid];
}

class RegisterUserEvent extends AuthEvent {
  final String email;
  final DateTime accountCreated;
  final String password;
  const RegisterUserEvent({
    required this.email,
    required this.accountCreated,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        accountCreated,
        password,
      ];
}

class LoadHomeEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
