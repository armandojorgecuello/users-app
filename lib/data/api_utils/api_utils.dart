
import 'package:dio/dio.dart';
import 'package:users_app/data/models/models.dart';

enum Method{
  get,
}

class ApiUtls{
  final Dio _client;
  final String _host;

  ApiUtls({
    required Dio client, 
    required String host
  }) : _client = client, _host = host;

  Future<Result<dynamic,BackendError>> makeRequest({
    required Method method,
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  })async{
    final uri = Uri.http(_host, path, queryParameters);

    final Response response;

    Options options = Options(
      headers: headers
    );

    try {
      switch (method) {
        case Method.get:
          response = await _client.getUri(uri, options: options);          
          break;
      }
      return Result.success(response.data);
    }on DioException catch (exception) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return  Result.fail(
            BackendError(
              statusCode: 408,
              description: exception.message,
              error: 'TimeOut'
            )
          );
        default:
        return Result.fail(
          BackendError(
            statusCode: exception.response?.statusCode ?? -1,
            data: exception.response?.data,
            description: exception.message,
            error: exception.error.toString()
          )
        );
      }
    }

  }


}