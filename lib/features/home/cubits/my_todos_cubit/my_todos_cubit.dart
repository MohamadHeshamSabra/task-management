import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/core/utils/variables.dart';
import 'package:task_manager_app/features/home/data/models/tasks.dart';
import 'package:task_manager_app/features/home/data/repos/home_repos.dart';

part 'my_todos_state.dart';

class MyTodosCubit extends Cubit<MyTodosState> {
  MyTodosCubit(this.homeRepos) : super(MyTodosInitial());
  HomeRepos homeRepos;

  myTodosForHomePage() async {
    late SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    emit(MyTodosLoading());
    var result = await homeRepos.getAllTodosByUserId(
      Variables.getAllTodosByUserId,
      sharedPreferences.getString("id"),
    );
    result.fold(
      (failuers) => emit(
        MyTodosFailure(
          errorMessage: failuers.erorrMassage,
        ),
      ),
      (todos) => emit(
        MyTodosSuccess(tasksList: todos),
      ),
    );
  }

  deleteTask(int id) async {
    await homeRepos.deleteATodo(Variables.deleteATodo, id);
  }

  upateTask(int id, bool completed) async {
    await homeRepos.updateATodo(Variables.updateATodo, id, completed);
  }
}
