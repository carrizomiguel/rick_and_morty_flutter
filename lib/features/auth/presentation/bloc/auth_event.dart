part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSubmitted extends AuthEvent {
  const AuthSubmitted({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;
}
