import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Utilities/my_button.dart';
import 'package:flutter_todo_app/view_model/view_model.dart';
import 'package:provider/provider.dart';
import '../model/task.dart';
import '../model/task.dart';

class EditDialogBox extends StatelessWidget {

  var textUser =TextEditingController();
  var updateTask=TextEditingController();
  String editTask;
  int index;

  EditDialogBox(this.index,this.editTask, { super.key});


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
                    controller: updateTask,
                    decoration: InputDecoration(
                      border:const OutlineInputBorder(),
                      hintText:editTask,

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(text: "save",

                        onPressed: (){
                          viewmodel.saveEditTask(index,updateTask );
                          //tasks[index].title= newTask.text;
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
