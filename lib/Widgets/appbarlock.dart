import 'package:clone_nexflix/constant.dart';
import 'package:flutter/material.dart';


class AppbarLock extends StatelessWidget {
  const AppbarLock({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.background,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.all(8.0),
      child: Center(child:Image.asset(MyImages.fullLogo,
      fit: BoxFit.fitHeight,)),
    );
  }
}