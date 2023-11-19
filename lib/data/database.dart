
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List tasks=[];

    final myBox=Hive.box('myBox');

    // run this method if this is the 1st time ever opening this app
    void createInitialData() {
      tasks = [
        ["Make Tutorial", false],
        ["Do Exercise", false],
      ];
    }

    // load the data from database
    void loadData() {
      tasks = myBox.get("TODOLIST");
    }

    // update the database
    void updateDataBase() {
      myBox.put("TODOLIST", tasks);
    }
}
