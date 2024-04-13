import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/utils/routes_path.dart';
import 'package:task_manager_app/features/auth/cubit/login_cubit.dart';
import 'package:task_manager_app/features/auth/data/repos/login_repos_imp.dart';
import 'package:task_manager_app/features/auth/presentation/views/login_page_view.dart';
import 'package:task_manager_app/features/home/cubits/add_new_cubit/add_new_todo_cubit.dart';
import 'package:task_manager_app/features/home/cubits/all_todos_cubit/all_todos_cubit.dart';
import 'package:task_manager_app/features/home/cubits/my_todos_cubit/my_todos_cubit.dart';
import 'package:task_manager_app/features/home/data/repos/home_repos_imp.dart';
import 'package:task_manager_app/features/home/presentation/views/home_page_view.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/add_new_task_page_view.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/my_todos_page.dart';
import 'package:task_manager_app/features/splash/presentation/views/splash_page_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splashPageView,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashPageView(),
    ),
    GoRoute(
      path: Routes.loginPageView,
      builder: (BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => LoginCubit(LoginReposImp()),
        child: const LoginPageView(),
      ),
    ),
    GoRoute(
      path: Routes.homePageView,
      builder: (BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => AllTodosCubit(
          HomeReposImp(),
        ),
        child: const HomePageView(),
      ),
    ),
    GoRoute(
        path: Routes.addNewTaskPageView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AddNewTodoCubit(
              HomeReposImp(),
            ),
            child: const AddNewTaskPageView(),
          );
        }),
    GoRoute(
        path: Routes.myTodosPageView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => MyTodosCubit(
              HomeReposImp(),
            ),
            child: const MyTodosPageView(),
          );
        }),
  ],
);
