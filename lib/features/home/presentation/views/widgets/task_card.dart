import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_app/core/local_db.dart';
import 'package:task_manager_app/core/utils/app_color.dart';
import 'package:task_manager_app/core/utils/images_assets.dart';
import 'package:task_manager_app/features/home/data/models/tasks.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    this.pencilOnPressed,
    this.trashOnPressed,
  });
  final Tasks task;
  final void Function()? pencilOnPressed;
  final void Function()? trashOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          children: [
            Text(
              task.todo,
              style: const TextStyle(fontSize: 18),
              softWrap: true,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              IconButton(
                onPressed: () {
                  LocalDb localDb = LocalDb();
                  localDb.updateData('''
  UPDATE alltasks
  SET , completed = ${!task.completed}
  WHERE userId = ${task.userId};
''');

                  pencilOnPressed;
                },
                iconSize: 50,
                icon: SvgPicture.asset(
                  ImagesAssets.pencil,
                ),
              ),
              IconButton(
                onPressed: () {
                  LocalDb localDb = LocalDb();
                  localDb
                      .deleteData('DELETE FROM alltasks WHERE id = ${task.id}');
                  trashOnPressed;
                },
                iconSize: 50,
                icon: SvgPicture.asset(
                  ImagesAssets.trash,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
