import 'package:clone_nexflix/Widgets/appbarlock.dart';
import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home:  Column(mainAxisAlignment: MainAxisAlignment.start,
      children:const[AppbarLock()]),
=======
      home:  const SelectUser(),
>>>>>>> 9685e2aa04dbb3d0c803d9841546cd7ee6402008
    );
  }
}