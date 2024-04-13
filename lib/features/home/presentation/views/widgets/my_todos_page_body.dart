import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/home/cubits/my_todos_cubit/my_todos_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/task_card.dart';

class MyTodosPageViewBody extends StatelessWidget {
  const MyTodosPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<MyTodosCubit, MyTodosState>(
        listener: (context, state) {
          if (state is MyTodosFailure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is MyTodosSuccess) {
            return ListView.builder(
              itemCount: state.tasksList != null ? state.tasksList!.length : 0,
              itemBuilder: (context, index) {
                return TaskCard(
                  task: state.tasksList![index],
                  pencilOnPressed: () {
                    BlocProvider.of<MyTodosCubit>(context).upateTask(
                      state.tasksList![index].id,
                      state.tasksList![index].completed,
                    );
                    BlocProvider.of<MyTodosCubit>(context).myTodosForHomePage();
                  },
                  trashOnPressed: () {
                    BlocProvider.of<MyTodosCubit>(context).deleteTask(
                      state.tasksList![index].id,
                    );
                    BlocProvider.of<MyTodosCubit>(context).myTodosForHomePage();
                  },
                );
              },
            );
          } else if (state is MyTodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
