part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class UserSignUpEvent extends UserEvent {
  final String name;
  final String lastName;
  final String email;
  final String password;
  const UserSignUpEvent({
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
  });
  @override
  // TODO: implement props
  List<Object> get props => [name, lastName, email, password];
}

final class UserGetEvent extends UserEvent {
  const UserGetEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

final class UserUpdateEvent extends UserEvent {
  const UserUpdateEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
