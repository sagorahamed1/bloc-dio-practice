import 'package:bloc_api_request/bloc/products/products_bloc.dart';
import 'package:bloc_api_request/bloc/user/user_bloc.dart';
import 'package:bloc_api_request/providers/user_provider.dart';
import 'package:bloc_api_request/route/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helpers/dio_helper.dart';


void main() {
  DioHelper.init(baseUrl: "https://jsonplaceholder.typicode.com");
  runApp( MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc(getProvider: GetProvider(dio: DioHelper.dio))),
        BlocProvider(create: (context) => ProductsBloc(getProvider: GetProvider(dio: DioHelper.dio)))
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: 'Bloc Practice',
      debugShowCheckedModeBanner: false,
      routeInformationParser: Routes.router.routeInformationParser,
      routerDelegate: Routes.router.routerDelegate,
      routeInformationProvider: Routes.router.routeInformationProvider,
    );
  }
}
