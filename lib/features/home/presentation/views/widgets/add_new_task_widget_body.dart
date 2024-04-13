import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_app/core/local_db.dart';
import 'package:task_manager_app/core/utils/app_color.dart';
import 'package:task_manager_app/features/home/cubits/add_new_cubit/add_new_todo_cubit.dart';

class AddNewTaskWidgetBody extends StatefulWidget {
  const AddNewTaskWidgetBody({super.key});

  @override
  State<AddNewTaskWidgetBody> createState() => _AddNewTaskWidgetBodyState();
}

class _AddNewTaskWidgetBodyState extends State<AddNewTaskWidgetBody> {
  String todo = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 56,
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onChanged: (value) {
              todo = value;
            },
            decoration: InputDecoration(
              border: inputBorderFun(
                choosedColor: const Color.fromARGB(255, 133, 130, 130),
              ),
              focusedBorder: inputBorderFun(
                choosedColor: const Color.fromARGB(255, 133, 130, 130),
              ),
              enabledBorder: inputBorderFun(
                choosedColor: const Color.fromARGB(255, 133, 130, 130),
              ),
              errorBorder: inputBorderFun(
                choosedColor: const Color.fromARGB(255, 133, 130, 130),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Completed"),
            Checkbox(
              value: BlocProvider.of<AddNewTodoCubit>(context).completed,
              onChanged: (bool) {
                BlocProvider.of<AddNewTodoCubit>(context).onChanged(bool);
                setState(() {});
              },
            ),
          ],
        ),
        MaterialButton(
          color: AppColors.primaryColor,
          shape: const CircleBorder(),
          height: 150,
          onPressed: () async {
            print(todo);
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            LocalDb localDb = LocalDb();
            var result = localDb.insertData('''
        INSERT INTO alltasks (todo, completed, userId)
        VALUES ('$todo',${BlocProvider.of<AddNewTodoCubit>(context).completed == true ? 1 : 0}, ${sharedPreferences.getString("userId")});
        ''');
            BlocProvider.of<AddNewTodoCubit>(context).addNewTodo(todo);
            print(sharedPreferences.getString("userId"));
            print(result);
          },
          child: const Text("Add"),
        )
      ],
    );
  }

  inputBorderFun({required Color choosedColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: choosedColor),
    );
  }
}
