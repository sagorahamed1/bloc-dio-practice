import 'package:bloc_api_request/bloc/user/user_event.dart';
import 'package:bloc_api_request/bloc/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_model.dart';
import '../../providers/user_provider.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetProvider getProvider;

  UserBloc({required this.getProvider}) : super(UserInitialState()) {
    on<FetchUserEvent>(onFetchUserEvent);
  }


  Future<void> onFetchUserEvent(
      FetchUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final response = await getProvider.getUser("/users");
      if(response.statusCode == 200){
        var data = List<UserModel>.from(response.data.map((x) => UserModel.fromJson(x)));
        emit(UserLoadedState(data));
      }
    } catch (error, stackTrace) {
      emit(UserErrorState(error.toString()));
      print("Error: $error\nStacktrace: $stackTrace");
    }
  }
}