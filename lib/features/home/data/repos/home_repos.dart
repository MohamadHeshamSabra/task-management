import 'package:dartz/dartz.dart';
import 'package:task_manager_app/core/errors/failures.dart';
import 'package:task_manager_app/features/home/data/models/deleted_task.dart';
import 'package:task_manager_app/features/home/data/models/tasks.dart';

abstract class HomeRepos {
  Future<Either<Failuers, Tasks>> addANewTodo(urlPath, data, contentType);
  Future<Either<Failuers, DeletedTask>> deleteATodo(urlPath, id);
  Future<Either<Failuers, List<Tasks>>> getAllTodos(urlPath);
  Future<Either<Failuers, Tasks>> getSingleTodo(urlPath, id);
  Future<Either<Failuers, Tasks>> getRandomTodo(urlPath);
  Future<Either<Failuers, List<Tasks>>> limitAndSkipTodos(
      {required int limit, required int skip});
  Future<Either<Failuers, List<Tasks>>> getAllTodosByUserId(urlPath, id);
  Future<Either<Failuers, Tasks>> updateATodo(urlPath, id, completed);
}
