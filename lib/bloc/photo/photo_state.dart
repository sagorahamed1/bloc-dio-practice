import 'package:bloc_api_request/models/photo_model.dart';

abstract class PhotoState{}

class PhotoInitState extends PhotoState{}

class PhotoLoadingState extends PhotoState{}

class PhotoLoadedState extends PhotoState{
  List <PhotoModel>? photoData;

  PhotoLoadedState(this.photoData);
}


class PhotoErrorState extends PhotoState{
  String? errorMessage;
  PhotoErrorState(this.errorMessage);
}