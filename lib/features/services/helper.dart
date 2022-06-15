import 'package:dio/dio.dart';

Future<Dio> getApi() async {
  final Dio _dio = Dio();
  const _baseUrl = "https://jsonplaceholder.typicode.com";
  final headers = {
    'Content-Type': 'application/json',
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials":
        true, // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
  };
  _dio.options.headers = headers;
  _dio.options.baseUrl = _baseUrl;
  _dio.interceptors.add(LogInterceptor(requestBody: false));
  return _dio;
}
