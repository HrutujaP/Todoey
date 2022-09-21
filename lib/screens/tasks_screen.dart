import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:state_management_examples/screens/hint_screen.dart';
import '../widgets/Tasks_List.dart';
import '../screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import '../models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      floatingActionButton: AvatarGlow(
        glowColor: Colors.black,
        endRadius: 35,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => addTaskScreen(),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AvatarGlow(
                  glowColor: Colors.purple,
                  endRadius: 40,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Hint(),
                      );
                    },
                    child: CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30,
                        color: Colors.purple,
                      ),
                      backgroundColor: Colors.pink.shade50,
                      radius: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(color: Colors.purple, fontSize: 18),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Tasks_List(),
            ),
          ),
        ],
      ),
    );
  }
}
