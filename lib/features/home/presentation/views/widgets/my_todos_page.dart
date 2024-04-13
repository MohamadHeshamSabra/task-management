import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/utils/routes_path.dart';
import 'package:task_manager_app/features/home/cubits/my_todos_cubit/my_todos_cubit.dart';
import 'package:task_manager_app/features/home/data/repos/home_repos_imp.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/my_todos_page_body.dart';

class MyTodosPageView extends StatelessWidget {
  const MyTodosPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go(
            Routes.homePageView,
          ),
          icon: const Icon(
            Icons.arrow_circle_left,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => MyTodosCubit(HomeReposImp())..myTodosForHomePage(),
        child: const MyTodosPageViewBody(),
      ),
    );
  }
}
