
import 'package:clone_nexflix/constant.dart';
import 'package:clone_nexflix/user.dart';
import 'package:flutter/material.dart';

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
      home:  Scaffold(
        backgroundColor: MyColors.background,
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(MyImages.fullLogo,fit:BoxFit.fitHeight,
          height: 100,),
          backgroundColor: MyColors.background,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children:const[SelectUser()]),
      ),
    );
  }
}