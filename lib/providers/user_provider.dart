import 'package:bloc_api_request/models/user_model.dart';
import 'package:dio/dio.dart';

class UserProvider {
  final Dio dio;

  UserProvider({required this.dio});

  Future<Response> getUser(String uri) async {
    try {
      final response = await dio.get(uri.toString());
      return response;
    } catch (error, stackTrace) {
      print("Error: $error\nStacktrace: $stackTrace");
      return Future.error(error);
    }
  }
}
