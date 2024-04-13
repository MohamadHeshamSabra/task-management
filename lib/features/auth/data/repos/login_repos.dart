import 'package:dartz/dartz.dart';
import 'package:task_manager_app/core/errors/failures.dart';
import 'package:task_manager_app/features/home/data/models/user.dart';

abstract class LoginRepos {
  Future<Either<Failuers, User>> loginWithUserNameAndPassword(
      String loginUrl, Object data);
}
