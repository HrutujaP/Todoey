import 'package:shared_preferences/shared_preferences.dart';

class Local_Storage {
  Future<List<List<String>>> updateLocalStorage(
      List<String> taskNames, List<String> toggles) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tasks', taskNames);
    await prefs.setStringList('toggles', toggles);

    List<List<String>> result = await readLocalStorage();

    return result;
  }

  Future<List<List<String>>> readLocalStorage() async {
    List<String> taskNames, toggles;
    final prefs = await SharedPreferences.getInstance();
    taskNames = await prefs.getStringList('tasks');
    toggles = await prefs.getStringList('toggles');

    print("tasks :" + taskNames.toString());
    print("toggles :" + toggles.toString());

    if (taskNames == null || toggles == null) {
      prefs.clear();
      taskNames = [];
      toggles = [];
      List<List<String>> result = await updateLocalStorage(taskNames, toggles);
      return result;
    }

    return [taskNames, toggles];
  }
}
