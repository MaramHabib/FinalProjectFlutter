import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/view_model/view_model.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Consumer<ViewModel>(builder: (context ,viewModel ,child ){

      var totalTask=viewModel.getLengthTask();
      var completeTask=viewModel.getLengthComplete();
      var notComplete=totalTask-completeTask;


      return Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(title: const Text("Welcome to Dashboard")),
        body: Center(child:
        SafeArea(
          child: Column(

            children: [
              const SizedBox(height: 50,),
              Card(
                color:Colors.purple[800],
                child: const SizedBox(
                  width: 800,
                  height: 80,
                  child: Center(
                      child: Text('Total Tasks',
                        style:TextStyle(color:Colors.white,fontSize: 20),)),
                ),
              ),
              Card(
                color:Colors.purple[300],
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: Center(
                      child: Text('$totalTask',
                        style:const TextStyle(color:Colors.white,fontSize: 20),)),
                ),
              ),


              const SizedBox(height: 20,),
              Card(
                color:Colors.purple[800],
                child: const SizedBox(
                  width: 800,
                  height: 80,
                  child: Center(
                      child: Text('Completed Task',
                        style:TextStyle(color:Colors.white,fontSize: 20),)),
                ),
              ),

              Card(
                color:Colors.purple[300],
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: Center(
                      child: Text('$completeTask',
                        style:const TextStyle(color:Colors.white,fontSize: 20),)),
                ),
              ),


              const SizedBox(height: 50,),
              Card(
                color:Colors.purple[800],
                child: const SizedBox(
                  width: 800,
                  height: 80,
                  child: Center(
                      child: Text('Not Completed Task',
                        style:TextStyle(color:Colors.white,fontSize: 20),)),
                ),
              ),
              Card(
                color:Colors.purple[300],
                child: SizedBox(
                  width: 200,
                  height: 80,
                  child: Center(
                      child: Text('$notComplete',
                        style:const TextStyle(color:Colors.white,fontSize: 20),)),
                ),
              ),


            ],
          ),
        )
        ),

      );
    });

  }
}


