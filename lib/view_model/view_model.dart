import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../Utilities/dialog_box.dart';
import '../Utilities/edit_dialog_box.dart';
import '../data/database.dart';
import '../model/user.dart';
import '../model/task.dart';

class ViewModel extends ChangeNotifier{
  User user=User('Maram Ashraf Tawfik');

  List<Task> tasks = <Task>[];
  final myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  void createInitialData() {
    tasks = [
      Task( 'Studying Flutter', false),
      Task( 'Cleaning Home', false),
      Task( 'Make Lunch', false),


    ];
  }

  void addTask(Task newTask){
    db.tasks.add(newTask);
    notifyListeners();

  }

  String getListOfTask(int index){

    return db.tasks[index].title ;
  }

  bool getValueOfTask(int index){

    return db.tasks[index].complete;
  }

  int getLengthTask(){

    return db.tasks.length;
  }

  int getLengthComplete(){

    List<Task> complete=tasks.where((t) => t.complete == true ).toList();
    return complete.length;
  }

  // void main() {
  //   List<Employee> employees = [
  //     Employee('Alice', 3),
  //     Employee('Bob', 6),
  //     Employee('Charlie', 2),
  //     Employee('Dave', 8),
  //     Employee('Eve', 4),
  //   ];
  //
  //   List<Employee> longTermEmployees = employees.where((e) => e.yearsOfService > 5).toList();
  //   print(longTermEmployees.map((e) => e.name).toList()); // ['Bob', 'Dave']
  // }

  void main() {
    List<int> numbers = [1, 2, 3, 4, 5, 6];
    List<int> evenNumbers = numbers.where((n) => n % 2 == 0).toList();
    print(evenNumbers); // [2, 4, 6]
  }

  void setTaskValue ( int taskIndex , bool taskValue  ){

    db.tasks[taskIndex].complete = taskValue;

    notifyListeners();
  }

  String getTitleOfTask(int index){

    return db.tasks[index].title ;
  }

  void editTask(int index,context){
   // TextEditingController controller =
    // x=TextEditingController(text: tasks[index].title);
    dynamic x=db.tasks[index].title;


    showDialog(
        context: context,
        builder: (context){
          return EditDialogBox(index,x);
        });
    notifyListeners();
   // tasks[index].title = newTask.text;
    //Navigator.of(context).pop;
  }

  void saveEditTask(int index,TextEditingController newTask){


      db.tasks[index].title= newTask.text;
      notifyListeners();

    }




    void deleteTask( int taskIndex){

    db.tasks.removeAt(taskIndex);
    notifyListeners();
  }
}