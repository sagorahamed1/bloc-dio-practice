import 'package:dio/dio.dart';

class GetProvider {
  final Dio dio;

  GetProvider({required this.dio});

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
