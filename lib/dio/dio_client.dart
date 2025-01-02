import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.example.com', // Replace with your API base URL
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add headers or authentication tokens here
          options.headers['Authorization'] = 'Bearer your_token_here';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Handle responses globally (e.g., logging)
          print('Response: ${response.data}');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          // Handle errors globally
          print('Error: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
