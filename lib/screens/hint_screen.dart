import 'package:flutter/material.dart';

class Hint extends StatelessWidget {
  const Hint({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 114, 114, 114),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "How To Use TODEY",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              HintTiles(
                icon: Icons.add_circle_rounded,
                hint: "- To Edit a task.",
              ),
              HintTiles(
                icon: Icons.edit,
                hint: "- To Add a new task.",
              ),
              HintTiles(
                icon: null,
                hint: "Tap on a task to mark it as important.",
              ),
              HintTiles(
                icon: null,
                hint: "Click on the checkbox to mark the task as completed.",
              ),
              HintTiles(
                icon: null,
                hint: "Tap and hold on a task to delete it.",
              ),
              // HintTiles(
              //   leadingText: "2.",
              //   title: "Tap and hold on a task to delete it.",
              // ),
              // HintTiles(
              //   leadingText: "3.",
              //   title:
              //       "Tap on the checkbox beside a particular task to mark  it as done.",
              // ),
              // HintTiles(
              //     leadingText: "4.",
              //     title: "Tap on a task to mark it important. "),
              // HintTiles(
              //   leadingText: "5.",
              //   title: "Click on the 🖊️ to edit a particular task.",
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class HintTiles extends StatelessWidget {
  String hint, leading;
  IconData icon;
  HintTiles({this.hint, this.icon, this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          icon != null
              ? Icon(
                  icon,
                  color: Colors.purple,
                )
              : Text(
                  leading,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
          icon != null
              ? SizedBox(
                  width: 10,
                )
              : Center(),
          Text(
            hint,
            style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
