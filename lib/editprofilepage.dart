import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({ Key? key }) : super(key: key);

  PreferredSizeWidget _appBar() {
    return AppBar(
      leadingWidth: 38.0,
      automaticallyImplyLeading: true,
      title: const Text(
        MyStrings.editProfile,
        style: TextStyle(fontSize: 18.0),
      ),
      backgroundColor: MyColors.background,
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background,
        appBar: _appBar(),
      );
  }
}