
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List myTasks=[];

  final _myBox=Hive.box('myBox');
}