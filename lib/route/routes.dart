import 'package:go_router/go_router.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_state.dart';
import '../pregentations/screens/home/home_screen.dart';
import '../pregentations/screens/log_in/log_in_screen.dart';
import '../pregentations/screens/signup/sign_up_screen.dart';

class Routes{
  // Define GoRouter
 static final authBloc = context.watch<AuthBloc>();
 static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomeScreen(),
        redirect: (context, state) =>
        authBloc.state is Authenticated ? null : '/login',
      ),
    ],
  );

  static get context => null;
}