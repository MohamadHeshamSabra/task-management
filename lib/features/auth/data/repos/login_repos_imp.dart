import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/core/api/api_service.dart';
import 'package:task_manager_app/core/errors/failures.dart';
import 'package:task_manager_app/features/auth/data/repos/login_repos.dart';
import 'package:task_manager_app/features/home/data/models/user.dart';

class LoginReposImp extends LoginRepos {
  final ApiService apiService = ApiService();
  late SharedPreferences sharedPreferences;
  @override
  Future<Either<Failuers, User>> loginWithUserNameAndPassword(
      String loginUrl, Object data) async {
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      var response = await apiService.post(
        endPoint: loginUrl,
        data: data,
        theContentType: 'application/json',
      );

      sharedPreferences.setString("id", response["id"].toString());
      sharedPreferences.setString("username", response["username"]);
      sharedPreferences.setString("email", response["email"]);
      sharedPreferences.setString("firstName", response["firstName"]);
      sharedPreferences.setString("lastName", response["lastName"]);
      sharedPreferences.setString("gender", response["gender"]);
      sharedPreferences.setString("image", response["image"]);
      sharedPreferences.setString("token", response["token"]);

      return right(User.fromJson(response));
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        ServerFailuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }
}
