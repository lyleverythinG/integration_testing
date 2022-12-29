part of 'userdata_bloc.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();
}

class UserInit extends UserDataEvent {
  final String uid;

  const UserInit({required this.uid});
  @override
  List<Object> get props => [uid];
}

class UserUpdate extends UserDataEvent {
  final UserModel user;
  const UserUpdate({required this.user});
  @override
  List<Object> get props => [user];
}

class UserDataDispose extends UserDataEvent {
  const UserDataDispose();
  @override
  List<Object> get props => [];
}
