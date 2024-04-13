import 'package:dio/dio.dart';
import 'package:task_manager_app/core/utils/variables.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Variables.mainUrlPath,
      // connectTimeout: const Duration(seconds: 5),
      // receiveTimeout: const Duration(seconds: 5),
      // sendTimeout: const Duration(seconds: 5),
    ),
  );
  Future<Map<String, dynamic>> get(
      {required String endPoint, queryParameters}) async {
    var response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint,
      queryParameters,
      theHeaders,
      theContentType}) async {
    var response = await dio.put(endPoint,
        queryParameters: queryParameters,
        options: Options(headers: theHeaders, contentType: theContentType));
    return response.data;
  }

  Future<Map<String, dynamic>> delete(
      {required String endPoint, queryParameters}) async {
    var response = await dio.delete(
      endPoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      required Object data,
      theHeaders,
      theContentType}) async {
    var response = await dio.post(endPoint,
        data: data,
        options: Options(headers: theHeaders, contentType: theContentType));
    return response.data;
  }
}
