
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/home_page.dart';
import 'package:flutter_todo_app/view_model/view_model.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'Utilities/login_page.dart';

void main(){
  //initiate hive
  runApp(
      ChangeNotifierProvider(create: (context)=>ViewModel(),
      child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:AnimatedSplashScreen(
        duration: 2500,
         splashIconSize: 300,
         backgroundColor: Colors.purple,
         splashTransition: SplashTransition.fadeTransition,
         //pageTransitionType:PageTransitionType.upToDown,
         splash:'assets/images/splash.png',
        nextScreen:const Login() ,) ,

      theme:ThemeData(primarySwatch: Colors.purple),
    );


  }
}



//HomePage()


