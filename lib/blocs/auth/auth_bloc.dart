import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/auth/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  StreamSubscription<auth.User?>? _userSubscription;
  AuthBloc({required AuthRepo authRepo})
      : _authRepo = authRepo,
        super(const AuthState.unknown()) {
    _userSubscription = _authRepo.user.listen(
      (user) {
        add(
          AuthUserChanged(user: user!),
        );
      },
    );

    on<AuthUserChanged>(_onUserChanged);
  }

  Future<void> _onUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.authenticated(user: event.user));
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
