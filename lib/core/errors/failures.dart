import 'package:dio/dio.dart';

class Failuers {
  final String erorrMassage;
  Failuers({required this.erorrMassage});
}

class ServerFailuers extends Failuers {
  ServerFailuers({required super.erorrMassage});

  factory ServerFailuers.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailuers(erorrMassage: 'Connection timeout with api');

      case DioExceptionType.sendTimeout:
        return ServerFailuers(erorrMassage: 'Send timeout with api');

      case DioExceptionType.receiveTimeout:
        return ServerFailuers(erorrMassage: 'Receive timeout with api');

      case DioExceptionType.badCertificate:
        return ServerFailuers.fromResponse(
            response: dioException.response!.data,
            stateusCode: dioException.response!.statusCode!);
      case DioExceptionType.badResponse:
        return ServerFailuers(erorrMassage: 'Error pls try again');

      case DioExceptionType.cancel:
        return ServerFailuers(erorrMassage: 'The requise canceld');

      case DioExceptionType.connectionError:
        return ServerFailuers(erorrMassage: 'Bad connection');

      case DioExceptionType.unknown:
        return ServerFailuers(erorrMassage: 'There is no internet');
    }
  }

  factory ServerFailuers.fromResponse(
      {required dynamic response, required int stateusCode}) {
    if (stateusCode == 400 || stateusCode == 401 || stateusCode == 403) {
      return ServerFailuers(erorrMassage: response['error']['massage']);
    } else if (stateusCode == 404) {
      return ServerFailuers(erorrMassage: "There is an error 404");
    } else if (stateusCode == 500) {
      return ServerFailuers(
          erorrMassage: "Internal server error, Please try again later");
    } else {
      return ServerFailuers(
          erorrMassage: "There is an error please try again later");
    }
  }
}
