import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/utils/app_color.dart';
import 'package:task_manager_app/core/utils/routes_path.dart';
import 'package:task_manager_app/features/home/cubits/all_todos_cubit/all_todos_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/drawer_image.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/drawer_select_option.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      color: AppColors.primaryColor,
      child: BlocBuilder<AllTodosCubit, AllTodosState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              DrawerImage(
                imageUrl: imageUrl,
              ),
              DrawerSelectOption(
                onTap: () => context.go(Routes.myTodosPageView),
                text: "My Todos",
              ),
              DrawerSelectOption(
                onTap: () => context.go(Routes.addNewTaskPageView),
                text: "Add a new todo",
              ),
            ],
          );
        },
      ),
    );
  }
}
