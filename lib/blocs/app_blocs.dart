import 'package:bloc_simple/blocs/app_events.dart';
import 'package:bloc_simple/blocs/app_states.dart';
import 'package:bloc_simple/repos/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo;
  UserBloc(this._userRepo) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await _userRepo.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(
          UserErrorState(e.toString()),
        );
      }
    });
  }
}
