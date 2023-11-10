import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  final VoidCallback deleteFunc;
  final VoidCallback editFunc;
  ToDoTile(
      {
        required this.taskName,
        required this.taskCompleted,
        required this.onChanged,
        required this.deleteFunc,
        required this.editFunc,
        super.key
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right:10.0,top:25.0),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color:Colors.purple[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
                value:taskCompleted,
                onChanged:onChanged,
                //activeColor: Colors.black,
            ),
            Expanded(
              child:Text(taskName,
                style:TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: Colors.white,
                  fontSize: 20,
            )),),
            Container(
              height:50 ,
              width:40,
              decoration:const BoxDecoration(
                  color:Colors.green,
                  //borderRadius:BorderRadius.horizontal(right: Radius.circular(12))
              ),
              child:IconButton(onPressed:editFunc,
                icon:const Icon(Icons.edit)),),

            Container(
              height:50 ,
              width:40,
              decoration:const BoxDecoration(
                  color:Colors.amber,
                  borderRadius:BorderRadius.horizontal(right: Radius.circular(12))
              ),
              child:IconButton(onPressed:deleteFunc,
                  icon:const Icon(Icons.delete)),),


          ],
        ),
      ),
    );
  }
}
