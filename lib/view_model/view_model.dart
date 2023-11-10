import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/user.dart';
import '../model/task.dart';

class ViewModel extends ChangeNotifier{
  User user=User('Maram Ashraf Tawfik');

  List<Task> tasks = <Task>[];
 // final _myBox=Hive.box('myBox');

  void addTask(Task newTask){
    tasks.add(newTask);
    notifyListeners();

  }

  String getListOfTask(int index){

    return tasks[index].title ;
  }

  bool getValueOfTask(int index){

    return tasks[index].complete;
  }

  int getLengthTask(){

    return tasks.length;
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

    tasks[taskIndex].complete = taskValue;

    notifyListeners();
  }

  String getTitleOfTask(int index){

    return tasks[index].title ;
  }

  void deleteTask( int taskIndex){

    tasks.removeAt(taskIndex);
    notifyListeners();
  }
}