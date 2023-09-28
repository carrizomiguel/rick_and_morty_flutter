import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthSubmitted>(_onSubmitted);
  }

  final _username = 'rick';
  final _password = '123456';

  Future<void> _onSubmitted(
    AuthSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        status: AuthStatus.loading,
      ),
    );
    await Future.delayed(const Duration(seconds: 2), () {
      if (event.username == _username && event.password == _password) {
        emit(
          state.copyWith(
            status: AuthStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.error,
          ),
        );
      }
    });
  }
}
