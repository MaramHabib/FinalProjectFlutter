

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/view_model/view_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Consumer<ViewModel>(builder: (context ,viewModel ,child ){

        return Container(
            decoration:const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: ListView.separated(
              padding:const EdgeInsets.all(15),
              separatorBuilder: (context , index) {
                return const SizedBox(height: 10);
              },
              itemCount:viewModel.getLengthTask() , //opration//
              itemBuilder: (context , index) {
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
                          value:viewModel.getValueOfTask(index),
                          onChanged:(value){

                            viewModel.setTaskValue(index, value!);
                          },
                          //activeColor: Colors.black,
                        ),
                        Expanded(
                          child:Text(viewModel.getTitleOfTask(index) ,
                              style:TextStyle(
                                decoration: viewModel.getValueOfTask(index)==true
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
                          child:IconButton(onPressed:(){},
                              icon:const Icon(Icons.edit)),),

                        Container(
                          height:50 ,
                          width:40,
                          decoration:const BoxDecoration(
                              color:Colors.amber,
                              borderRadius:BorderRadius.horizontal(right: Radius.circular(12))
                          ),
                          child:IconButton(onPressed:()=>viewModel.deleteTask(index),
                              icon:const Icon(Icons.delete)),),


                      ],
                    ),
                  ),
                );
              },
            ))
        ;
      })
    ;
  }
}
