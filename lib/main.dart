import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_management_examples/functions/Local_Storage.dart';
import 'package:state_management_examples/models/task_data.dart';
import './screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(doNotDisturb(
    prefs: prefs,
  ));
}

class doNotDisturb extends StatefulWidget {
  SharedPreferences prefs;
  // doNotDisturb({required this.prefs});
  doNotDisturb({@required this.prefs});

  @override
  State<doNotDisturb> createState() => _doNotDisturbState(prefs: prefs);
}

void savedData() async{
  TaskData taskData =await TaskData();
}

class _doNotDisturbState extends State<doNotDisturb> {
  SharedPreferences prefs;
  _doNotDisturbState({@required this.prefs});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    savedData();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => TaskData(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: TasksScreen(),
//       ),
//     );
//   }
// }
