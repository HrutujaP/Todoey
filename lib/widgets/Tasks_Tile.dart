import 'package:flutter/material.dart';
import '../models/task_data.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class Tasks_Tile extends StatefulWidget {
  bool isChecked = false;
  String taskTitle;
  final Function longPressCallback;
  final Function checkBoxCallback;
  final Function onTapCallback;
  final Function onEditCallback;
  Tasks_Tile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallback,
      this.longPressCallback,
      this.onTapCallback,
      this.onEditCallback});

  @override
  State<Tasks_Tile> createState() => _Tasks_TileState();
}

class _Tasks_TileState extends State<Tasks_Tile> {
  int idx;
  String newTaskTitle = "";
  TaskData taskdata = TaskData();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: widget.onEditCallback,
        child: Padding(
          padding: const EdgeInsets.only(top: 7.0),
          child: Icon(
            Icons.edit,
            size: 22,
            color: Colors.purple,
          ),
        ),
      ),
      onLongPress: widget.longPressCallback,
      title: Text(
        widget.taskTitle,
        style: TextStyle(
          decoration: widget.isChecked ? TextDecoration.lineThrough : null,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: widget.onTapCallback,
      trailing: Checkbox(
        activeColor: Colors.purple,
        value: widget.isChecked,
        onChanged: widget.checkBoxCallback,
      ),
    );
  }
}
