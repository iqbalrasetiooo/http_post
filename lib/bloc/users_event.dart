part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetAllUserEvent extends UsersEvent {
  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UsersEvent {
  final String name;
  final int age;

  const CreateUserEvent({required this.name, required this.age});
  @override
  List<Object> get props => [];
}
