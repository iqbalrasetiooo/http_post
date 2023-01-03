part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersError extends UsersState {
  final String? message;
  const UsersError(this.message);
}

class UsersSuccess extends UsersState {
  final List<UserModel> user;

  const UsersSuccess(this.user);
}
