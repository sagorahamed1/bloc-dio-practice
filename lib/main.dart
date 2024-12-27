import 'package:bloc_api_request/bloc/user/user_bloc.dart';
import 'package:bloc_api_request/pregentations/screens/user/user_screen.dart';
import 'package:bloc_api_request/providers/user_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helpers/dio_helper.dart';

void main() {
  DioHelper.init(baseUrl: "https://api.example.com");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Bloc Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(
              userProvider: UserProvider(
                dio: Dio(
                  BaseOptions(
                    baseUrl: 'https://fakestoreapi.com',
                    connectTimeout: const Duration(seconds: 10),
                    receiveTimeout: const Duration(seconds: 10),
                    responseType: ResponseType.json,
                  ),
                ),
              ),
            ),
          ),
        ],
        child: const UserScreen(),
      ),
    );
  }
}
