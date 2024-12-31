// Login Screen
import 'package:bloc_api_request/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.replaceNamed(Routes.homeScreen);
            // context.read<AuthBloc>().add(LoginEvent());

          },
          child: Text('Login'),
        ),
      ),
    );
  }
}