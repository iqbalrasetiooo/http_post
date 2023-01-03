import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http_get_post/api_service.dart';
import 'package:http_get_post/models/user_model.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<GetAllUserEvent>((event, emit) async {
      try {
        emit(UsersLoading());
        var users = await ApiService().getUser();
        emit(UsersSuccess(users));
      } catch (e) {
        emit(UsersError(e.toString()));
      }
    });
    on<CreateUserEvent>((event, emit) async {
      try {
        emit(UsersLoading());
        var users = await ApiService().registerUser(
          name: event.name,
          age: event.age.toString(),
        );
        emit(UsersSuccess(users));
      } catch (e) {
        emit(UsersError(e.toString()));
      }
    });
  }
}
