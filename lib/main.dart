import 'package:clone_nexflix/constant.dart';
import 'package:clone_nexflix/user.dart';
import 'package:clone_nexflix/userdetail.dart';
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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _edited = false;
  List<UserList> userList =
      List.generate(users.length, (index) => UserList(users[index]));

  void _clickEdit() {
    setState(() {
      _edited = !_edited;
    });
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: [
        IconButton(onPressed: _clickEdit, icon: const Icon(MyIcon.edit))
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
        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(onPressed: _clickEdit, icon: const Icon(MyIcon.back)),
      ),
      title: const Text(
        MyStrings.manageProfiles,
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: MyColors.background,
    );
  }

  Future<bool> _onWillPop() async {
    if (_edited) {
      _clickEdit();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: MyColors.background,
        appBar: _edited ? _appBarEidt() : _appBar(),
        body: ListView(
          children: <Widget>[GridView.count(
            crossAxisCount: 2,
            children: userList,
            padding: const EdgeInsets.symmetric(horizontal: 66),
            childAspectRatio: 0.82,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
          ]),
      ),
    );
  }
}
