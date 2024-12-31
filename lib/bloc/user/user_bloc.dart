import 'package:bloc_api_request/bloc/user/user_event.dart';
import 'package:bloc_api_request/bloc/user/user_state.dart';
import 'package:bloc_api_request/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../providers/user_provider.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserProvider userProvider;

  UserBloc({required this.userProvider}) : super(UserInitialState()) {
    on<FetchUserEvent>(onFetchUserEvent);
  }

  // Event handler for fetching users
  Future<void> onFetchUserEvent(
      FetchUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final response = await userProvider.getUser("/users");
      if(response.statusCode == 200){
        var data = (response.data as List).map((x)=> UserModel.fromJson(x)).toList();
        emit(UserLoadedState(data));
      }
    } catch (error, stackTrace) {
      emit(UserErrorState(error.toString()));
      print("Error: $error\nStacktrace: $stackTrace");
    }
  }
}