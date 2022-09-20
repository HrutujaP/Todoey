import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../models/task.dart';

List<String> taskNames = [];
List<String> toggles = [];

class TaskData extends ChangeNotifier {
  @override
  TaskData() {
    getTasks();
  }

  List<Task> _tasks = [];

  void getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    taskNames = await prefs.getStringList('tasks');
    toggles = await prefs.getStringList('toggles');
    // prefs.clear();
    if (taskNames != null && toggles != null) {
      for (int i = 0; i < taskNames.length; i++) {
        _tasks.add(Task(
            name: taskNames[i].toString(),
            isDone: toggles[i].toLowerCase() == 'true'));
        // print(taskNames[i] + " " + toggles[i]);
      }
    } else {
      await prefs.setStringList('tasks', []);
      await prefs.setStringList('toggles', []);
      final taskNames = await prefs.getStringList('tasks');
      final toggles = await prefs.getStringList('toggles');
      for (int i = 0; i < taskNames.length; i++) {
        _tasks.add(Task(
            name: taskNames[i], isDone: toggles[i].toLowerCase() == 'true'));
        print(taskNames[i]);
      }
    }
    print("Tasks :" + taskNames.toString());
    print("Toggles :" + toggles.toString());
    
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) async {
    final task = Task(name: newTaskTitle);
    taskNames.add(newTaskTitle);
    toggles.add('false');
    _tasks.add(task);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', taskNames);
    await prefs.setStringList('toggles', toggles);
    taskNames = await prefs.getStringList('tasks');
    toggles = await prefs.getStringList('toggles');
    print("Tasks :" + taskNames.toString());
    print("Toggles :" + toggles.toString());

    notifyListeners();
  }

  void updateTask(Task task) async {
    task.toggleDone();
    int idx = taskNames.indexOf(task.name);
    toggles[idx] = toggles[idx] == "true" ? "false" : "true";
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('toggles', toggles);
    taskNames = await prefs.getStringList('tasks');
    toggles = await prefs.getStringList('toggles');
    print("Tasks :" + taskNames.toString());
    print("Toggles :" + toggles.toString());
    notifyListeners();
  }

  void deleteTask(Task task) async {
    print(task.name);
    int idx = taskNames.indexOf(task.name);
    _tasks.remove(task);
    print(idx);
    taskNames.removeAt(idx);
    toggles.removeAt(idx);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', taskNames);
    await prefs.setStringList('toggles', toggles);
    taskNames = await prefs.getStringList('tasks');
    toggles = await prefs.getStringList('toggles');
    print("Tasks :" + taskNames.toString());
    print("Toggles :" + toggles.toString());
    notifyListeners();
  }

  void impTask(Task task) async {
    int idx = taskNames.indexOf(task.name);
    _tasks[idx].name = _tasks[idx].name + "⭐";
    taskNames[idx] = _tasks[idx].name;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', taskNames);
    await prefs.setStringList('toggles', toggles);
    taskNames = await prefs.getStringList('tasks');
    toggles = await prefs.getStringList('toggles');
    print("Tasks :" + taskNames.toString());
    print("Toggles :" + toggles.toString());
    // print(str);
    notifyListeners();
  }
}
