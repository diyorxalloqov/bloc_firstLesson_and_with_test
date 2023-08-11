import 'package:bloc/bloc.dart';
import 'package:bloc_first/domain/model/userModel.dart';
import 'package:bloc_first/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<UserGetEvent>(getUsers); // on<UserSignUpEvent>(signUp)
    on<UserUpdateEvent>(updateUsers);
    add(const UserGetEvent());
    setFunctionUpdateInterval();
  }

  final UserRepository _userRepository = UserRepository();

  Future<void> signUp(UserSignUpEvent event, Emitter<UserState> emit) async {
    emit(const UserLoadingState());
    Either<String, List<UserModel>> response = await _userRepository.signUp(
        event.name, event.lastName, event.email, event.password);
    response.fold(
        (l) => emit(UserErrorState(l)), (r) => emit(UserCompleteState(r)));
  }

  void setFunctionUpdateInterval() async {
    while (1 == 1) {
    print("salom");
      await Future.delayed(const Duration(seconds: 10));
      add(const UserUpdateEvent());
    }
    await Future.delayed(const Duration(seconds: 5));
    add(const UserUpdateEvent());
  }

  Future<void> getUsers(UserGetEvent event, Emitter<UserState> emit) async {
    emit(const UserLoadingState());
    Either<String, List<UserModel>> response = await _userRepository.getUsers();
    response.fold(
        (l) => emit(UserErrorState(l)), (r) => emit(UserCompleteState(r)));
  }

  Future<void> updateUsers(
      UserUpdateEvent event, Emitter<UserState> emit) async {
    Either<String, List<UserModel>> response =
        await _userRepository.updateUsers();
    emit(const UserLoadingState());
    print("hello user updated");
    response.fold(
        (l) => emit(UserErrorState(l)), (r) => emit(UserCompleteState(r)));
  }
}
