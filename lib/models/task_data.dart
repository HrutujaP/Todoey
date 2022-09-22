import 'dart:collection';
import 'package:flutter/foundation.dart';
import '../models/task.dart';
import "../functions/Local_Storage.dart";

class TaskData extends ChangeNotifier {
  TaskData() {
    getTasks();
  }
  List<String> taskNames = [];
  List<String> toggles = [];
  Local_Storage local_storage = Local_Storage();

  @override
  List<Task> _tasks = [];
  List<List<String>> result = [];

  void getTasks() async {
    result = await local_storage.readLocalStorage();
    taskNames = result[0];
    toggles = result[1]; //print(toggles);

    for (int i = 0; i < taskNames.length; i++) {
      _tasks.add(Task(
          name: taskNames[i].toString(),
          isDone: toggles[i].toLowerCase() == 'true'));
      // print(taskNames[i] + " " + toggles[i]);
    }
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
    result = await local_storage.updateLocalStorage(taskNames, toggles);
    taskNames = result[0];
    toggles = result[1];
    notifyListeners();
  }

  void updateTask(Task task) async {
    task.toggleDone();
    int idx = taskNames.indexOf(task.name);
    toggles[idx] = toggles[idx] == "true" ? "false" : "true";
    print(taskNames);
    print(toggles);
    result = await local_storage.updateLocalStorage(taskNames, toggles);
    taskNames = result[0];
    toggles = result[1];
    notifyListeners();
  }

  void editTask(int idx, String newTaskTitle) async {
    taskNames[idx] = newTaskTitle;

    result = await local_storage.updateLocalStorage(taskNames, toggles);
    taskNames = result[0];
    toggles = result[1];
    notifyListeners();
  }

  void deleteTask(Task task) async {
    print(task.name);
    int idx = taskNames.indexOf(task.name);
    _tasks.remove(task);
    print(idx);
    taskNames.removeAt(idx);
    toggles.removeAt(idx);
    result = await local_storage.updateLocalStorage(taskNames, toggles);
    taskNames = result[0];
    toggles = result[1];
    notifyListeners();
  }

  void impTask(Task task) async {
    int idx = taskNames.indexOf(task.name);
    print("⭐".allMatches(_tasks[idx].name).length);
    _tasks[idx].name = "⭐".allMatches(_tasks[idx].name).length > 2
        ? _tasks[idx].name
        : _tasks[idx].name + "⭐";
    taskNames[idx] = _tasks[idx].name;
    result = await local_storage.updateLocalStorage(taskNames, toggles);
    taskNames = result[0];
    toggles = result[1];
    notifyListeners();
  }
}
