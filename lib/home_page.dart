
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Utilities/dashboard.dart';
import 'package:flutter_todo_app/Utilities/dialog_box.dart';
import 'package:flutter_todo_app/Utilities/todo_list.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../view_model/view_model.dart';
import '../model/task.dart';
import 'Utilities/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _newTask=TextEditingController();

  //open a box


  List toDoList=[
    ["Cleaning Home",false],
    ["Studying Flutter",true],
    ["Playing with son",false],

  ];
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // void saveNewTask(){
  //   Task add=Task(_newTask.text,false);
  //   viewModel.addTask(add);
  //   // setState(() {
  //   //   toDoList.add([_newTask.text,false]);
  //   //   _newTask.clear();
  //   // });
  //   Navigator.of(context).pop;
  // }

  // void createNewTask(){
  //   showDialog(
  //       context: context,
  //       builder: (context){
  //         return MyDialogBox(
  //           controller: _newTask,
  //           onSave: saveNewTask,
  //           onCancel: ()=>{
  //             Navigator.of(context).pop(),
  //           },
  //         );
  //       });
  // }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);

    });
  }

  void saveEditTask(int index,TextEditingController newTask){

      setState(() {
        toDoList[index][0]= newTask.text;
        Navigator.of(context).pop;
      });




    Navigator.of(context).pop;

  }
  void editTask(int index){
    TextEditingController controller =
    TextEditingController(text: toDoList[index][0]);


    // showDialog(
    //     context: context,
    //     builder: (context){
    //       return MyDialogBox();
    //     });
  }

  @override
  Widget build(BuildContext context) {
  return
    Consumer<ViewModel>(builder:(
        (context,viewModel,child){
          return Scaffold(
            backgroundColor:Colors.purple[800],
            appBar: AppBar(title:const Text("Todo App")),

            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                onPressed:
                    (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return

                          MyDialogBox();
                      });
                },
                child:const Icon(Icons.add)
            ),

            body: SafeArea(
              child:

              Column(

                children: [
                  Expanded(
                      flex: 1,
                      child: Text("Hello")),
                  Expanded(
                      flex: 1,
                      child:Text("Hello") ),

                  Expanded(
                      flex: 5,
                      child: TaskList() ),
                ],
              ),
            ),


            bottomNavigationBar: BottomAppBar(
              shape:const CircularNotchedRectangle(),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Dashboard()),
                    );
                  } , icon: const Icon(Icons.task)),
                  IconButton(onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profile()),
                    );
                  } , icon: const Icon(Icons.person)),


                ],

              ),
            ),
          );
        }
    ));

  }
}
