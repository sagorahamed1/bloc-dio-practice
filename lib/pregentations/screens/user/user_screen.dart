import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/user/user_bloc.dart';
import '../../../bloc/user/user_event.dart';
import '../../../bloc/user/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(FetchUserEvent());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User Screen'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitialState) {
            return const Center(
                child: Text('Press the button to fetch users.'));
          }
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  leading: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)),
                      child: Image.network(user.image.toString())),
                  title: Text(user.title ?? 'No Name'),
                  subtitle: Text("${user.price.toString()} Take"),
                );
              },
            );
          }
          if (state is UserErrorState) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}