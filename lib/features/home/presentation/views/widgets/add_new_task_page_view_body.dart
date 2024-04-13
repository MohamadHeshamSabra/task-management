import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task_manager_app/features/home/cubits/add_new_cubit/add_new_todo_cubit.dart';
import 'package:task_manager_app/features/home/presentation/views/widgets/add_new_task_widget_body.dart';

class AddNewTaskPageViewBody extends StatelessWidget {
  const AddNewTaskPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AddNewTodoCubit, AddNewTodoState>(
        builder: (context, state) {
          if (state is AddNewTodoLoading) {
            return const ModalProgressHUD(
              inAsyncCall: true,
              child: AddNewTaskWidgetBody(),
            );
          } else {
            return const AddNewTaskWidgetBody();
          }
        },
      ),
    );
  }
}
