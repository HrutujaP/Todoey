import 'package:flutter/material.dart';

class Tasks_Tile extends StatefulWidget {
  bool isChecked = false;
  String taskTitle;
  final Function longPressCallback;
  final Function checkBoxCallback;
  final Function onTapCallback;
  Tasks_Tile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallback,
      this.longPressCallback,
      this.onTapCallback});

  @override
  State<Tasks_Tile> createState() => _Tasks_TileState();
}

class _Tasks_TileState extends State<Tasks_Tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
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
                          onChanged: (newText) {
                            // print(newTaskTitle);
                            setState(() {
                              if (newText != null) {
                                widget.taskTitle = newText;
                              }
                              // newTaskTitle = newText;
                            });
                          },
                          autofocus: true,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                            hintText: widget.taskTitle,
                            hintStyle: TextStyle(color: Colors.purple),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.purple.shade100),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Edit',
                            style:
                                TextStyle(color: Colors.purple, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
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
