import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/core/api/api_service.dart';
import 'package:task_manager_app/core/errors/failures.dart';
import 'package:task_manager_app/core/local_db.dart';
import 'package:task_manager_app/features/home/cubits/all_todos_cubit/all_todos_cubit.dart';
import 'package:task_manager_app/features/home/data/models/deleted_task.dart';
import 'package:task_manager_app/features/home/data/models/tasks.dart';
import 'package:task_manager_app/features/home/data/repos/home_repos.dart';

class HomeReposImp extends HomeRepos {
  ApiService apiService = ApiService();

  @override
  Future<Either<Failuers, Tasks>> addANewTodo(
      urlPath, data, contentType) async {
    try {
      var result = await apiService.post(
          endPoint: urlPath, data: data, theContentType: contentType);
      return right(
        Tasks.fromJson(result),
      );
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        Failuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failuers, DeletedTask>> deleteATodo(urlPath, id) async {
    try {
      var result = await apiService.delete(endPoint: "$urlPath$id");
      return right(DeletedTask.fromJson(result));
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        Failuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failuers, List<Tasks>>> getAllTodos(urlPath) async {
    try {
      var result = await apiService.get(endPoint: urlPath);
      List<Tasks> tasksList = [];
      for (int i = 0; i <= result.length; i++) {
        try {
          tasksList.add(Tasks.fromJson(result["todos"][i]));
        } catch (e) {
          tasksList.add(Tasks.fromJson(result["todos"][i]));
        }
      }
      return right(tasksList);
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        Failuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failuers, List<Tasks>>> getAllTodosByUserId(urlPath, id) async {
    try {
      var result = await apiService.get(endPoint: "$urlPath$id");
      List<Tasks> tasksList = [];
      for (int i = 0; i <= result.length; i++) {
        try {
          tasksList.add(Tasks.fromJson(result["todos"][i]));
        } catch (e) {
          tasksList.add(Tasks.fromJson(result["todos"][i]));
        }
      }
      return right(tasksList);
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        Failuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failuers, Tasks>> getRandomTodo(urlPath) async {
    try {
      var result = await apiService.get(endPoint: "$urlPath");

      return right(Tasks.fromJson(result));
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        Failuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failuers, Tasks>> getSingleTodo(urlPath, id) async {
    try {
      var result = await apiService.get(endPoint: "$urlPath$id");

      return right(Tasks.fromJson(result));
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        Failuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failuers, List<Tasks>>> limitAndSkipTodos(
      {required int limit, required int skip}) async {
    try {
      var result =
          await apiService.get(endPoint: "todos?limit=$limit&skip=$skip");
      List<Tasks> tasksList = [];

      int total = result["todos"].length;

      if (limit > total) {
        limit = total;
        AllTodosSuccess.completedList = true;
      }
      for (int i = 0; i < limit; i++) {
        LocalDb localDb = LocalDb();
        localDb.insertData(
            '''INSERT INTO alltasks (todo, completed, userId) VALUES ('${result["todos"][i]["todo"].replaceAll("'", "\\\'")}',0, ${result["todos"][i]["userId"]});''');
        try {
          tasksList.add(Tasks.fromJson(result["todos"][i]));
        } catch (e) {
          print(limit.toString());
          print(i.toString());
          tasksList.add(Tasks.fromJson(result["todos"][i]));
        }
      }

      return right(tasksList);
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        Failuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failuers, Tasks>> updateATodo(urlPath, id, completed) async {
    try {
      var result = await apiService.put(
          endPoint: "$urlPath$id",
          theContentType: 'application/json',
          queryParameters: {"complated": !completed});
      return right(
        Tasks.fromJson(result),
      );
    } on DioException catch (e) {
      return left(
        ServerFailuers.fromDioError(e),
      );
    } on Exception catch (e) {
      return left(
        Failuers(
          erorrMassage: e.toString(),
        ),
      );
    }
  }
}
