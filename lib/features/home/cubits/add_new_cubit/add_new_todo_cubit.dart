import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/core/utils/variables.dart';
import 'package:task_manager_app/features/home/data/repos/home_repos.dart';

part 'add_new_todo_state.dart';

class AddNewTodoCubit extends Cubit<AddNewTodoState> {
  AddNewTodoCubit(this.homeRepos) : super(AddNewTodoInitial());
  HomeRepos homeRepos;
  bool completed = false;

  void Function(bool?)? onChanged(value) {
    completed = value;

    return null;
  }

  addNewTodo(todo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    emit(AddNewTodoLoading());
    var result = await homeRepos.addANewTodo(
      Variables.addABewTodo,
      {
        "todo": todo,
        "completed": completed,
        "userId": "Bearer${sharedPreferences.getString("token")}",
      },
      'application/json',
    );
    result.fold((l) => emit(AddNewTodoSuccess()), (r) => AddNewTodoFailure());
  }
}
