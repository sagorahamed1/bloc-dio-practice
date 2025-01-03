import 'package:bloc_api_request/bloc/products/products_bloc.dart';
import 'package:bloc_api_request/bloc/user/user_bloc.dart';
import 'package:bloc_api_request/helpers/dio_helper.dart';
import 'package:bloc_api_request/pregentations/screens/photo/photo_screen.dart';
import 'package:bloc_api_request/pregentations/screens/product/products_screen.dart';
import 'package:bloc_api_request/pregentations/screens/user/user_screen.dart';
import 'package:bloc_api_request/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../pregentations/screens/home/home_screen.dart';
import '../pregentations/screens/log_in/log_in_screen.dart';
import '../pregentations/screens/photo_details/photo_details_screen.dart';
import '../pregentations/screens/signup/sign_up_screen.dart';

class Routes{


  static const login = "/login";
  static const signup = "/signup";
  static const homeScreen = "/homeScreen";
  static const userScreen = "/UserScreen";
  static const productsScreen = "/ProductsScreen";
  static const photoScreen = "/PhotoScreen";
  static const photoDetailsScreen = "/PhotoDetailsScreen";

 static final GoRouter router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(
        path: login,
        name: login,
        builder: (context, state) => LogInScreen(),
      ),
      GoRoute(
        path: signup,
        name: signup,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: homeScreen,
        name: homeScreen,
        builder: (context, state) => HomeScreen(),
      ),

      GoRoute(
        path: userScreen,
        name: userScreen,
        builder: (context, state) => BlocProvider(
            create: (context) => UserBloc(getProvider: GetProvider(dio: DioHelper.dio)),
            child: const UserScreen()),
      ),


      GoRoute(
        path: productsScreen,
        name: productsScreen,
        builder: (context, state) => BlocProvider(
            create: (context) => ProductsBloc(getProvider: GetProvider(dio: DioHelper.dio)),
            child: const ProductsScreen()),
      ),


      GoRoute(path: photoScreen,
      name: photoScreen,
      builder: (context, state) => PhotoScreen()) ,


      GoRoute(path: photoDetailsScreen,
      name: photoDetailsScreen,
      builder: (context, state) {

        final data = state.extra as Map<String, String>;

        final image = data["photo"] ?? "";
        final title = data["title"]?? "";
        return PhotoDetailsScreen(title: title, photo: image);})
    ],
  );
}