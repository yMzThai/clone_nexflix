import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({ Key? key }) : super(key: key);

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leadingWidth: 38.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(MyIcon.back)),
      ),
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
        appBar: _appBar(context),
      );
  }
}