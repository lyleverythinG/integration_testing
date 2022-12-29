part of 'userdata_bloc.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();
}

class UserDataInitial extends UserDataState {
  @override
  List<Object> get props => [];
}

class UserUpdated extends UserDataState {
  final UserModel? user;

  const UserUpdated({this.user});

  @override
  List<Object> get props => [user!];
}
