import 'package:flutter/material.dart';

class Hint extends StatelessWidget {
  const Hint({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 114, 114, 114),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink.shade100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                leadingText: "1.",
                title: "Add a task by clicking the  ➕ button.",
              ),
              HintTiles(
                leadingText: "2.",
                title: "Hold on a specific task to delete it.",
              ),
              HintTiles(
                leadingText: "3.",
                title:
                    "Tap on the checkbox beside a particular task to mark  it as done.",
              ),
              HintTiles(
                  leadingText: "4.",
                  title:
                      "Tap on a specifc task to mark it as important (Add's a ⭐ to the task). "),
              HintTiles(
                leadingText: "5.",
                title: "Tap on the edit button to edit a task.",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HintTiles extends StatelessWidget {
  String leadingText, title;

  HintTiles({this.leadingText, this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(leadingText,
          style: TextStyle(
              wordSpacing: 0.01,
              letterSpacing: 0.01,
              fontSize: 22,
              fontWeight: FontWeight.w500)),
      subtitle: Text(title,
          style: TextStyle(
              wordSpacing: 0.01,
              letterSpacing: 0.01,
              fontSize: 18,
              fontWeight: FontWeight.w500)),
    );
  }
}
