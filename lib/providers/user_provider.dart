import 'package:bloc_api_request/models/user_model.dart';
import 'package:dio/dio.dart';

class UserProvider {
  final Dio dio;

  UserProvider({required this.dio});

  Future<List<UserModel>> getUser() async {
    try {
      final response = await dio.get("/products");
      return (response.data as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
    } catch (error, stackTrace) {
      print("Error: $error\nStacktrace: $stackTrace");
      return Future.error(error);
    }
  }
}
