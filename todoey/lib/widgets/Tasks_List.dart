import 'package:flutter/material.dart';
import '../models/task_data.dart';
import 'Tasks_Tile.dart';
import 'package:provider/provider.dart';

class Tasks_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Tasks_Tile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallback: (currentCheckBoxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
              onTapCallback: () {
                taskData.impTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
