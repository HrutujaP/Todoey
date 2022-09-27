import 'package:flutter/material.dart';
import '../models/task_data.dart';
import 'Tasks_Tile.dart';
import 'package:provider/provider.dart';

class Tasks_List extends StatefulWidget {
  @override
  State<Tasks_List> createState() => _Tasks_ListState();
}

class _Tasks_ListState extends State<Tasks_List> {
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
              onEditCallback: () {
                String newTask;
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.pink.shade50,
                        title: Center(
                          child: Text(
                            "Edit Task",
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        content: Container(
                          height: 120,
                          width: 40,
                          child: Column(
                            children: [
                              TextField(
                                controller:
                                    TextEditingController(text: task.name),
                                onChanged: (newText) {
                                  
                                  newTask = newText;
                                },
                                autofocus: true,
                                cursorColor: Colors.deepPurple,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.purple),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purple),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.purple.shade100),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                setState(() {
                                  taskData.editTask(task, newTask);
                                  task.name = newTask;
                                });
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: Colors.purple, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
