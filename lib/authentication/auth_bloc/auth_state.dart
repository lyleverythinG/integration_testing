part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class NoLoginUser extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthWaiting extends AuthState {
  @override
  List<Object> get props => [];
}

class ErrorMessage extends AuthState {
  final String message;
  const ErrorMessage({required this.message});
  @override
  List<Object> get props => [message];
}

class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class MechanicFound extends AuthState {
  @override
  List<Object> get props => [];
}

class HomeInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends AuthState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends AuthState {
  final String loadingStatus;
  final IconData? icon;

  const HomeLoadingState(
    this.loadingStatus, {
    this.icon,
  });
  @override
  List<Object?> get props => [
        loadingStatus,
        icon,
      ];
}
