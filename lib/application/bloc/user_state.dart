part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitialState extends UserState {
  const UserInitialState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

final class UserLoadingState extends UserState {
  const UserLoadingState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

final class UserErrorState extends UserState {
  final String errorMessage;
  const UserErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object> get props => [];
}

final class UserCompleteState extends UserState {
  final List<UserModel> data;
  const UserCompleteState(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
