// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:task_manager_app/core/local_db.dart';
import 'package:task_manager_app/core/utils/variables.dart';
import 'package:task_manager_app/features/home/data/models/tasks.dart';
import 'package:task_manager_app/features/home/data/repos/home_repos.dart';
part 'all_todos_state.dart';

class AllTodosCubit extends Cubit<AllTodosState> {
  AllTodosCubit(this.homeRepos) : super(AllTodosInitial());
  HomeRepos homeRepos;

  List<Tasks> list = [];

  ScrollController scrollController = ScrollController();
  void setUpScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          AllTodosInitial.limit += 15;

          print(AllTodosInitial.limit);
          getAllTodosForHomePage();
        }
      }
    });
  }

  getAllTodosForHomePage() async {
    print(AllTodosSuccess.completedList.toString());
    if (AllTodosSuccess.completedList == false) {
      emit(ALlTodosLoading());
      var result = await homeRepos.limitAndSkipTodos(
        limit: AllTodosInitial.limit,
        skip: AllTodosInitial.skip,
      );

      result.fold(
          (failuers) => emit(
                AllTodosFailure(
                  errorMessage: failuers.erorrMassage,
                ),
              ), (todos) {
        emit(
          AllTodosSuccess(tasksList: todos),
        );
      });
    }
  }

  deleteTask(int id) async {
    await homeRepos.deleteATodo(Variables.deleteATodo, id);
  }

  upateTask(int id, bool completed) async {
    await homeRepos.updateATodo(Variables.updateATodo, id, completed);
  }
}
