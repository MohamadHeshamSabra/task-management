import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/home/cubits/all_todos_cubit/all_todos_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/task_card.dart';

class HomePageViewBody extends StatefulWidget {
  const HomePageViewBody({
    super.key,
  });

  @override
  State<HomePageViewBody> createState() => _HomePageViewBodyState();
}

class _HomePageViewBodyState extends State<HomePageViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AllTodosCubit, AllTodosState>(
        listener: (context, state) {
          if (state is AllTodosFailure) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          BlocProvider.of<AllTodosCubit>(context)
              .setUpScrollController(context);
          if (state is AllTodosSuccess) {
            return ListView.builder(
              controller:
                  BlocProvider.of<AllTodosCubit>(context).scrollController,
              itemCount: state.tasksList != null ? state.tasksList!.length : 0,
              itemBuilder: (context, index) {
                return TaskCard(
                  task: state.tasksList![index],
                  pencilOnPressed: () {
                    BlocProvider.of<AllTodosCubit>(context).upateTask(
                        state.tasksList![index].id,
                        state.tasksList![index].completed);
                    BlocProvider.of<AllTodosCubit>(context)
                        .getAllTodosForHomePage();
                  },
                  trashOnPressed: () {
                    BlocProvider.of<AllTodosCubit>(context)
                        .deleteTask(state.tasksList![index].id);
                    BlocProvider.of<AllTodosCubit>(context)
                        .getAllTodosForHomePage();
                  },
                );
              },
            );
          } else if (state is ALlTodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            BlocProvider.of<AllTodosCubit>(context).getAllTodosForHomePage();

            return const SizedBox();
          }
        },
      ),
    );
  }
}
