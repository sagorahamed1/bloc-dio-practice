// Bloc for Authentication
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(Unauthenticated()) {
    on<LoginEvent>((event, emit) => emit(Authenticated()));
    on<LogoutEvent>((event, emit) => emit(Unauthenticated()));
  }
}