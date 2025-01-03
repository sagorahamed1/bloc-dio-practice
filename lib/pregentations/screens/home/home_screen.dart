// Home Screen
import 'package:bloc_api_request/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/auth/auth_event.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
              context.go('/login');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            onTap: (){
              context.pushNamed(Routes.userScreen);
            },
            title: const Text("User Screen"),
          ),


          ListTile(
            onTap: (){
              context.push(Routes.productsScreen);
            },
            title: const Text("Product Screen one"),
          ),


          ListTile(
            onTap: (){
              context.pushNamed(Routes.photoScreen);
            },
            title: const Text("Photo Screen"),
          )
        ],
      ),
    );
  }
}
