import 'package:clone_nexflix/constant.dart';
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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _Edited = false;

  void _clickEdit() {
    setState(() {
      _Edited = !_Edited;
    });
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: _clickEdit,
            icon: const Icon(MyIcon.edit))
      ],
      title: Image.asset(
        MyImages.fullLogo,
        fit: BoxFit.fitHeight,
        height: 120,
      ),
      backgroundColor: MyColors.background,
    );
  }
  

  PreferredSizeWidget _appBarEidt() {
    return AppBar(
      leadingWidth: 38.0,
      leading: Padding(
        padding: const EdgeInsets.only(left:10.0),
        child: IconButton(
            onPressed: _clickEdit,
            icon: Icon(MyIcon.back)),
      ),
      title: Text(
          MyStrings.manageProfiles,
          style: TextStyle(fontSize: 18.0),
        ),
      backgroundColor: MyColors.background,
    );
  }

  Future<bool> _onWillPop() async {
    if(_Edited){
      _clickEdit();
      return false;
    }else{
      return true;
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_onWillPop,
      child: Scaffold(
        backgroundColor: MyColors.background,
        appBar: _Edited ? _appBarEidt() : _appBar(),
        body: Container(),
      ),
    );
  }
}
