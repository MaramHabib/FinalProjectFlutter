import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Utilities/my_button.dart';
import 'package:flutter_todo_app/view_model/view_model.dart';
import 'package:provider/provider.dart';
import '../model/task.dart';

class MyDialogBox extends StatelessWidget {

  final textUser = TextEditingController();


 MyDialogBox({super.key});


  @override
  Widget build(BuildContext context) {

    return   Consumer<ViewModel>(builder: (context , viewmodel ,child  ){
      return AlertDialog(
          backgroundColor: Colors.purple[50],
          content:Container(
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(0)
              ),
              height:150 ,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: textUser,
                    decoration: const InputDecoration(
                      border:OutlineInputBorder(),
                      hintText: "Add a New Task",

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(text: "save",

                        onPressed: () {

                          Task x = Task(textUser.text, false);
                          viewmodel.addTask(x );
                          //print(textUser.text);
                          textUser.clear();
                          Navigator.of(context).pop();

                        },

                      ),
                      const SizedBox(width:10),
                      MyButton(text: "cancel", onPressed:(){
                        Navigator.of(context).pop();
                      }),
                      //cancel button
                    ],

                  )
                ],
              )
          )
      );
    });

  }
}
