// States for Authentication Bloc
abstract class AuthState {}
class Authenticated extends AuthState {}
class Unauthenticated extends AuthState {}