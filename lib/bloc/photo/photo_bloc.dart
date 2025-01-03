import 'package:bloc_api_request/bloc/photo/photo_event.dart';
import 'package:bloc_api_request/bloc/photo/photo_state.dart';
import 'package:bloc_api_request/models/photo_model.dart';
import 'package:bloc_api_request/providers/user_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState>{
  final GetProvider getProvider;
  PhotoBloc({required this.getProvider}):super(PhotoInitState()){
    on<PhotoEvent>(fetchPhoto);
  }


  Future <void> fetchPhoto (PhotoEvent event, Emitter<PhotoState> emit)async{
    emit(PhotoLoadingState());

    var response = await getProvider.getUser("/photos");

    if(response.statusCode == 200){
      var data = List<PhotoModel>.from(response.data.map((x)=> PhotoModel.fromJson(x)));

      emit(PhotoLoadedState(data));
    }else{
      emit(PhotoErrorState(response.data.toString()));
    }
  }
}


