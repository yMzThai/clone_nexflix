import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class Main2 extends StatefulWidget {
  const Main2({Key? key}) : super(key: key);

  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {
  List<Widget> pages =
      List.generate(4, (i) => Center(child: Text(i.toString())));
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: pages.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        items: MyPage().bottomNavigationBarItems,
        showUnselectedLabels: true,
        unselectedFontSize: 9.0,
        selectedFontSize: 9.0,
        unselectedItemColor: MyColors.unselectTab,
        selectedItemColor: MyColors.text,
        backgroundColor: MyColors.tab,
        iconSize: 28.0,
        onTap: (int i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}


