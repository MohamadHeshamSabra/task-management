import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:task_manager_app/core/utils/routes_path.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/add_new_task_page_view_body.dart';

class AddNewTaskPageView extends StatelessWidget {
  const AddNewTaskPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Todo"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.go(
            Routes.homePageView,
          ),
          icon: const Icon(
            Icons.arrow_circle_left,
          ),
        ),
      ),
      body: const AddNewTaskPageViewBody(),
    );
  }
}
